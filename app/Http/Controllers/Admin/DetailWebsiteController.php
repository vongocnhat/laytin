<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Session;
use App\DetailWebsite;
use App\Website;

class DetailWebsiteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $detailWebsites = DetailWebsite::with('website')->get();
        return view('admin.detailwebsite.index', compact('detailWebsites'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $domainNames = Website::pluck('domainName', 'id');
        return view('admin.detailwebsite.create', compact('domainNames'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $detailWebsite = new DetailWebsite();
        $detailWebsite->fill($request->all());
        $detailWebsite->save();
        Session::flash('thongbao', 'Thêm Thành Công');
        return redirect()->route('detailwebsite.index');

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
        //
        $domainNames = Website::pluck('domainName', 'id');
        $detailWebsite = DetailWebsite::findOrFail($id);
        return view('admin.detailwebsite.edit', compact('detailWebsite', 'domainNames'));
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
        $detailWebsite = DetailWebsite::findOrFail($id);
        $detailWebsite->fill($request->all());
        $detailWebsite->save();
        Session::flash('thongbao', 'Cập Nhật Thành Công');
        // return redirect()->route('supports.index');
        return redirect()->route('detailwebsite.index');
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
            DetailWebsite::whereIn('id', $ids)->delete(); 
        return back();
    }

    public function active(Request $request) {
        $id = $request->input('id');
        $model = DetailWebsite::findorfail($id);
        $model->active = !$model->active;
        $model->save();
    }
}
