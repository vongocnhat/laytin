<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Symfony\Component\DomCrawler\Crawler;
use GuzzleHttp\Client as GuzzleClient;
use GuzzleHttp\Promise;
use GuzzleHttp\Pool;
use GuzzleHttp\Psr7\Request as GuzzleRequest;
use App\Website;
use App\Category;
use App\DetailWebsite;
use App\KeyWord;
use App\Content;
ini_set('max_execution_time', 86400);

class CrawlerController extends Controller
{
    private $LoadLimit = 1;
    // Websites from database
    private $domainName = 'http://www.24h.com.vn';
    private $menuTag = '#zone_footer > ul > li';
    private $numberPage = 2;
    private $limitOfOnePage = 14;
    private $stringFirstPage = '?vpage=';
    private $stringLastPage = '';
    // */Websites from database
    // DetailWebsites form database
    private $containerTag = '.boxDoi-sub-Item-trangtrong';
    private $titleTag= '.news-title';
    private $descriptionTag = '.news-sapo';
    private $pubDateTag = '.update-time';

    // private $containerTag = '.baiviet-TopContent';
    // private $titleTag= '.news-title16-G';
    // private $descriptionTag = '.news-sapo';
    // private $pubDateTag = '.update-time';
    // */DetailWebsites form database
    // keywords table
    private $KeyWords;
    // */keywords table
    private $listNews = [];
    private $hasError = false;
    private $categories;
    private $contents;
    private $listLinkInserted = [];
    private $linkSuccesses = [];
    private $linkErrors = [];
    public function index()
    {
        $this->categories = Category::with('keyWordsActive')->get();
        $this->contents = Content::all();
        echo '<a style="background-color: #28a745; color:#fff; padding: 15px;" href="'.route("home").'">Home</a><br><br>';
        $time1 = date('H:i:s', time());
        echo 'Start: '.$time1.'</br>';
        // lấy dữ liệu từ database
        $websites = Website::with('detailWebsites', 'category')->where('active', 1)->get();
        foreach ($websites as $key => $website) {
            $this->domainName = $website->domainName;
            $this->menuTag = $website->menuTag;
            $this->numberPage = $website->numberPage;
            $this->limitOfOnePage = $website->limitOfOnePage;
            $this->stringFirstPage = $website->stringFirstPage;
            $this->stringLastPage = $website->stringLastPage;
            $requests = function () {
                yield new GuzzleRequest('GET', $this->domainName);
            };
            $client = new GuzzleClient();
            $pool = new Pool($client, $requests(), [
                'concurrency' => $this->LoadLimit,
                'fulfilled' => function ($response, $index) use ($website) {
                    if (empty($website->menuTag)) {
                        $documentUTF8 = $response->getBody();
                        if (stripos($response->getHeader('content-type')[0], 'iso-8859-1')) {
                            $documentUTF8 = utf8_encode($response->getBody());
                        }
                        $this->getNewsInMenu($documentUTF8, $website, $website->domainName);
                    } else {
                        $document = new Crawler();
                        $documentUTF8 = $response->getBody();
                        if (stripos($response->getHeader('content-type')[0], 'iso-8859-1')) {
                            $documentUTF8 = utf8_encode($response->getBody());
                        }
                        $document->addHtmlContent($documentUTF8);
                        $nodes = $document->filter($this->menuTag);
                        $ignoreWebsites = explode(';', $website->ignoreWebsite);

                        for ($i=0; $i < $nodes->count(); $i++) { 
                            $menuHref = $nodes->eq($i)->attr('href');
                            if (empty($menuHref)) {
                                array_push($this->linkErrors, 'Sai menuTag Của Website: '.$this->domainName.' menuTag Phải Là Thẻ a');
                            } else {
                                if(!$this->startWithHtml($menuHref)) {
                                    //replace // = /
                                    $startLink = parse_url($this->domainName, PHP_URL_SCHEME) . '://' . parse_url($this->domainName, PHP_URL_HOST);
                                    $endLink =  '/' . $menuHref;
                                    $menuHref = $startLink . str_replace('//', '/', $endLink);
                                }
                                // lấy danh mục tin tức
                                $checkIgnore = false;
                                foreach ($ignoreWebsites as $key => $ignoreWebsite) {
                                    // bỏ tất cả đấu space
                                     // dd($ignoreWebsite);
                                    // echo ($ignoreWebsite == $menuHref);
                                    $ignoreWebsite = trim($ignoreWebsite);
                                    $ignoreWebsite = str_replace('/', '', $ignoreWebsite);
                                    $tempMenuHref = trim($menuHref);
                                    $tempMenuHref = str_replace('/', '', $tempMenuHref);
                                    if ($ignoreWebsite == $tempMenuHref) {
                                        $checkIgnore = true;
                                        break;
                                    }
                                }
                                if ($checkIgnore == false) {
                                    $this->getNews($menuHref, $website);
                                }
                                // */lấy danh mục tin tức
                            }
                        }
                        if ($nodes->count() == 0)
                            echo '<span style="color:red">Sai menuTag Của Website: '.$this->domainName.' menuTag<br></span>';
                    }
                },
                'rejected' => function ($reason, $index) {
                    // this is delivered each failed request
                    $this->hasError = true;
                    array_push($this->linkErrors, 'Không Thể Kết Nối Đến: '.$this->domainName.' Có Thể Do Sai Đường Dẫn');
                },
            ]);
            // Initiate the transfers and create a promise
            $promise = $pool->promise();
            // Force the pool of requests to complete.
            $promise->wait();
        }
        $refreshTime = 600000;
        echo '<span style="color: green">Tải Tin Thành Công Tải Lại Sau: ' . ($refreshTime / 1000) . ' Giây</span>';
        $linkSuccesses = $this->linkSuccesses;
        $linkErrors = $this->linkErrors;
        return view('admin.rss', compact('refreshTime', 'linkSuccesses', 'linkErrors'));
    }

    public function getNews($menuHref, $website) {
        // biến để chứa node
        $titleNode;
        $hrefNode;
        $descriptionNode;
        $pubDateNode;
        // */biến để chứ tag
        // biến lấy để hiển thị ra view
        $title;
        $href;
        $description;
        $pubDate;
        $listTitleInserted = [];
        $requests = function () use ($menuHref) {
            for ($i = 0; $i < $this->numberPage; $i++) {
                if (empty($this->stringFirstPage)) {
                    yield new GuzzleRequest('GET', $menuHref);
                } else {
                    yield new GuzzleRequest('GET', $menuHref . $this->stringFirstPage . ($i + 1) . $this->stringLastPage);
                }
            }
        };
        $client = new GuzzleClient();
        $pool = new Pool($client, $requests(), [
            'concurrency' => $this->LoadLimit,
            'fulfilled' => function ($response, $index) use ($website, $menuHref) {
                //menuHrefDocument = https://vnexpress.net/tin-tuc/thoi-su/page/1;
                $documentUTF8 = $response->getBody();
                if (stripos($response->getHeader('content-type')[0], 'iso-8859-1')) {
                    $documentUTF8 = utf8_encode($response->getBody());
                }
                if (!empty($this->stringFirstPage)) {
                    $menuHref = $menuHref . $this->stringFirstPage . ($index + 1) . $this->stringLastPage;
                }
                $this->getNewsInMenu($documentUTF8, $website, $menuHref);
            },
            'rejected' => function ($reason, $index) {
                // this is delivered each failed request
                array_push($this->linkErrors, 'Không Thể Kết Nối Đến: ' . $reason->getRequest()->getUri());
                $this->hasError = true;
            },
        ]);
        // Initiate the transfers and create a promise
        $promise = $pool->promise();
        // Force the pool of requests to complete.
        $promise->wait();
    }

    private function getNewsInMenu($document, $website, $menuHref)
    {
        $menuHrefDocument = new Crawler();
        $menuHrefDocument->addHtmlContent($document);
        foreach ($website['detailWebsites'] as $key => $detailWebsite) {
            $items = $menuHrefDocument->filter($detailWebsite->containerTag);
            if ($items->count() > 0) {
                $limitOfOnePage = $website->limitOfOnePage;
                if ($website->limitOfOnePage == 0 || isset($website->limitOfOnePage) == false) {
                    $limitOfOnePage = $items->count();
                }
                for ($i = 0; $i < $limitOfOnePage; $i++) {
                    $item = $items->eq($i);
                    $this->getItem($website, $detailWebsite, $item);
                }
            }
        }
        array_push($this->linkSuccesses, $menuHref);
    }

    private function getItem($website, $detailWebsite, $item)
    {
        $title = '';
        $link = null;
        $description = null;
        $pubDate = null;
        //title is empty stop all;
        if (!empty($detailWebsite->titleTag)) {
            $titleNode = $item->filter($detailWebsite->titleTag);
            if ($titleNode->count() > 0) {
                $title = $titleNode->text();
                $link = $titleNode->attr('href');
            }
            if (!empty($detailWebsite->descriptionTag)) {
                $descriptionNode = $item->filter($detailWebsite->descriptionTag);
                if ($descriptionNode->count() > 0) {
                    $description = $descriptionNode->text();
                }
            }
            if (!empty($detailWebsite->pubDateTag)) {
                $pubDateNode = $item->filter($detailWebsite->pubDateTag);
                if ($pubDateNode->count() > 0) {
                    if (empty($detailWebsite->attr_pub_date)) {
                        $pubDate = $pubDateNode->text();
                    } else {
                        $pubDate = $pubDateNode->attr($detailWebsite->attr_pub_date);
                    }
                }
            }
            //save to db
            $this->saveNewsToDB($title, $link, $description, $pubDate, $website);
        }
    }

    private function saveNewsToDB($title, $link, $description, $pubDate, $website)
    {
        //local
        if(!$this->startWithHtml($link)) {
            $startLink = parse_url($this->domainName, PHP_URL_SCHEME) . '://' . parse_url($this->domainName, PHP_URL_HOST);
            $endLink = '/' . $link;
            $link = $startLink . str_replace('//', '/', $endLink);
        }
        $compareLinkInserted = str_replace('/', '', $link);
        $inserted = in_array($compareLinkInserted, $this->listLinkInserted);
        if ($inserted == false) {
            $available = false;
            foreach ($this->contents as $key => $item) {
                if ($compareLinkInserted == str_replace('/', '', $item->link)) {
                    $available = true;
                    break;
                }
            }
            //in database
            if ($available == false) {
                foreach ($this->categories as $key => $category) {
                    if ($category->id == 1) {
                        continue;
                    }
                    $matchChar = false;
                    $category_id = $category->id;
                    if (isset($website->category)) {
                        if ($website->category->id == 1) {
                            $matchChar = true;
                            $category_id = 1;
                        }
                    } else {
                        foreach ($category->keyWordsActive as $keyWord) {
                            if ($this->matchChar($title, $keyWord->name)) {
                                // break keyWords;
                                $matchChar = true;
                                break;
                            }
                        }
                    }
                    if ($matchChar == true) {
                        $content = new Content();
                        $content->category_id = $category_id;
                        //href rss
                        $content->sourceOfNews = $website->domainName;
                        $content->title = $title;
                        $content->link = $link;
                        // html_entity_decode to show "" '' / () or {!!!!}
                        $content->description = $description;
                        // convert datetime
                        $pubDateTemp = date('Y-m-d H:i:s', strtotime($pubDate));
                        if (strtotime($pubDate) <= strtotime('1971-01-01')) {
                            $pubDateTemp = $pubDate;
                        }
                        // */convert datetime
                        $content->pubDate = $pubDateTemp;
                        $content->save();
                        array_push($this->listLinkInserted, $compareLinkInserted);
                    }
                    if ($category_id == 1) {
                        break;
                    }
                }
            }
        }
    }

    private $time1;
    function start() {
        $this->time1 = date('H:i:s', time());
        echo 'Start: '.$this->time1.'</br>';
    }

    function end() {
        $time2 = date('H:i:s', time());
        echo 'End: '.$time2.'</br>';
        $timestamp1 = strtotime($this->time1);
        $timestamp2 = strtotime($time2);
        echo 'Sum: '.($timestamp2 - $timestamp1).'</br></br>';
    }

    function startWithHtml($href) {
        return substr( $href, 0, 4 ) == "http" ? true : false;
    }
    // tìm chính xác từ
    private function matchChar($string, $keyWord) {
        $string = ' '.$string.' ';
        $string = $this->removeSymbol($string);
        $keyWord = $this->removeSymbol($keyWord);
        $index = stripos($string, $keyWord);
        if($index == true && gettype($index) == 'integer')
        {
            $indexBefore = $index-1;
            $indexAfter = $index+strlen($keyWord);
            $charBefore = substr($string, $indexBefore, 1);
            $charAfter = substr($string, $indexAfter, 1);
            // '*How area you?*' contain 'how are' = false
            // '*How are" you?*' contain 'how are' = true
            if(!(ctype_alpha($charBefore) || ctype_alpha($charAfter)))
                return true;
        }
        return false;
    }
    private function removeSymbol($string) {
        $charStrings = str_split($string);
        $string = '';
        $asc = -1;
        foreach ($charStrings as $value) {
            $asc = ord($value);
            if(!(($asc >= 33 && $asc <= 47) || ($asc >= 58 && $asc <= 64) || ($asc >= 91 && $asc <= 96) || ($asc >= 123 && $asc <= 126)))
                $string .= $value;
        }
        // thay thế nhiều dấu space thành 1 dấu
        $string = preg_replace('!\s+!', ' ', $string);
        return $string;
    }
}