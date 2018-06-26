<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Content;
use App\RSS;
use App\Category;

class ContentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $contents = Content::where('active', 1)->get();
        return view('admin.contents.index',compact('contents'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::pluck('name', 'id');
        return view('admin.contents.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $con= new content();
        $con->fill($request->except('pubDate'));
        $con->pubDate = date('Y-m-d H:i:s');
        $con->save();
        return redirect()->route('content.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = Category::pluck('name', 'id');
        $edit = content::findorfail($id);
        return view('admin.contents.edit',compact('edit', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $edit = content::findorfail($id);
        $edit->fill($request->except('pubDate'));
        $edit->save();
        return redirect()->route('content.index');

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
}
    public function destroy($id, Request $request)
    {
        $ids = $request->input('idCheckbox');
        if($ids != null) {
            Content::whereIn('id', $ids)->delete(); 
        }
        return back();
    }

    public function active(Request $request)
    {
        $id = $request->input('id');
        $model = Content::findorfail($id);
        $model->active = !$model->active;
        $model->save();
    }

    public function exportView()
    {
        return view('admin.contents.exportSetting');
    }

}
