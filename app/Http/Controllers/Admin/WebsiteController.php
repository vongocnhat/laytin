<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\website;
use App\Content;

class WebsiteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $website_data = website::all();
        return view('admin.websites.index',compact('website_data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.websites.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
          // $website = $request->all();
        // 2.luu
        // website::create([
        //     //'field' trong database =>'name tu view'
        //     'domainName' => $website['domainName'],//lay du lieu tu view co ten la title do vao filled title trong model
        //     'menuTag' =>$website['menuTag'],
        //     'numberPage'=>$website['numberPage'],
        //     'limitOfOnePage'=>$website['limitOfOnePage'],
        //     'stringFirstPage'=>$website['stringFirstPage'],
        //     'stringLastPage'=>$website['stringLastPage'],
        //     'active'=>$website['active'],
        //     'bodyTag'=>$website['bodyTag'],
        //     'exceptTag'=>$website['exceptTag']
        // ]);
        $website = new Website();
        $website->fill($request->all());
        $website->save();
        return redirect()->route('website.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
         $webupdate = website::findOrFail($id);
         return view('admin.websites.edit', compact('webupdate'));
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
        //

        $webupdate = website::findOrFail($id);

        $webupdate->fill($request->all());

        $webupdate->save();
        return redirect()->route('website.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id, Request $request)
    {
        $ids = $request->input('idCheckbox');
        if($ids != null)
        {
            $domainNames = Website::select('domainName')->whereIn('id', $ids)->get();
            Content::whereIn('domainName', $domainNames)->delete(); 
            Website::whereIn('id', $ids)->delete();
        }
        return back();
    }

    public function active(Request $request) {
        $id = $request->input('id');
        $model = Website::findorfail($id);
        $model->active = !$model->active;
        $model->save();
    }
}
