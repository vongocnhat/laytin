<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\rss;
use App\Content;

class RSSAdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $rss=rss::all();
        return view('admin.rsss.index',compact('rss'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.rsss.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rss= new rss();
        $rss->fill($request->all());
        $rss->save();
        return redirect()->route('rss.index');
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
        $rss = rss::findorfail($id);
        return view('admin.rsss.edit',compact('rss'));
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
        $rss = rss::findorfail($id);
        $rss->fill($request->all());
        $rss->save();
        return redirect()->route('rss.index');

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
        if($ids != null)
        {
            RSS::whereIn('id', $ids)->delete();
        }
        return back();
    }

    public function active(Request $request) {
        $id = $request->input('id');
        $model = RSS::findorfail($id);
        $model->active = !$model->active;
        $model->save();
    }
}
