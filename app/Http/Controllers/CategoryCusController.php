<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Collection;
use Symfony\Component\DomCrawler\Crawler;
use Excel;
use App\Category;
use App\Content;

class CategoryCusController extends Controller
{
	public function show(Request $request, $categoryID)
	{
		$toDayContentsCount = 0;
        $sumToDayContentsCount = 0;
        $categories = Category::with('contents')->get();
        $toDay = strtotime(date("Y-m-d"));
        foreach ($categories as $key => $category) {
            foreach ($category['contents'] as $key => $content) {
                if (strtotime($content->pubDate) >= $toDay) {
                    $toDayContentsCount++;
                }
            }
            if ($category->id == $categoryID) {
                $sumToDayContentsCount = $toDayContentsCount;
            }
            $category->toDayContentsCount = $toDayContentsCount;
            $toDayContentsCount = 0;
        }
		$contents = $categories->find($categoryID)->contentsActive();
		$searchStr = $request->input('searchStr');
		if (!empty($searchStr)) {
            $contents = $contents->where('title', 'like', '%'.$searchStr.'%');
        }
        if (session()->has('perPage')) {
            if (isset($request->perPage)) {
                session()->put('perPage', $request->perPage);
            }
        } else {
            session()->put('perPage', 20);
        }
        //search date
        if (isset($request->fromDate) && isset($request->toDate)) {
            //2018-06-24 23:59:59
            $toDate = $request->toDate . ' 23:59:59';
            $contents = $contents->where([['pubDate', '>=', $request->fromDate], ['pubDate', '<=', $toDate]]);
        }
        //export excel
        $contents = $contents->orderByRaw("CASE WHEN DAYNAME(pubDate) IS NOT NULL THEN pubDate END DESC")->orderBy('id', 'DESC');
        if (isset($request->excel)) {
            $this->export($contents);
            return;
        }
        $contents = $contents->paginate(session()->get('perPage'));
        $contents->toDayContentsCount = $sumToDayContentsCount;
        if ($request->ajax()) {
            return view('contents-ajax', compact('contents'));  
        }
		return view('homePage', compact('contents', 'categories', 'searchStr', 'categoryID'));
	}

    public function export($contents)
    {
        $contents = $contents->orderByRaw("CASE WHEN DAYNAME(pubDate) IS NOT NULL THEN pubDate END DESC")->orderBy('id', 'DESC')->get(['title', 'description','pubDate', 'sourceOfNews']);
        $description = '';
        foreach ($contents as $key => $content) {
            $content->title = html_entity_decode($content->title);
            $document = new Crawler();
            $document->addHtmlContent($content->description);
            if ($document->count() > 0)
                $description = $document->text();
            $content->description = html_entity_decode($description);
            $pubDateTemp = date('H:i:s d/m/Y', strtotime($content->pubDate));
            if (strtotime($content->pubDate) <= strtotime('1971-01-01')) {
                $pubDateTemp = $content->pubDate;
            }
            $content->pubDate = $pubDateTemp;
        }
        Excel::create('contents', function($excel) use($contents) {
            $excel->sheet('contents', function($sheet) use($contents) {
                $sheet->loadView('admin.exports.content', compact('contents'));
                $sheet->getStyle('B2:' . 'B' . ($contents->count() + 1))->getAlignment()->setWrapText(true);
                $sheet->getStyle('C2:' . 'C' . ($contents->count() + 1))->getAlignment()->setWrapText(true);
                $sheet->setAutoSize([
                    'A', 'D', 'E'
                ]);
            });
        })->export('xlsx');
    }
}