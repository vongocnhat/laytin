@extends('admin.layouts.default')
@section('content')
<h3>Create DetailWebsites</h3>
{{-- nhận thông điệp từ controller --}}
<div>
  @if(Session::has('thongbao'))
    <span class="alert alert-success">{{ Session::get('thongbao') }}</span>
  @endif
</div>
{!! Form::open(['route' => 'detailwebsite.store', 'method' => 'post', 'class' => 'col-12']) !!}
  <div class="form-group">
    {{ Form::label(null, 'DomainName') }}
    {{ Form::select('website_id', $domainNames, Request::get('website_id'), ['class' => 'form-control', 'placeholder' => 'Chọn DomainName', 'required']) }}
  </div>
  <div class="form-group">
    {{ Form::label(null, 'ContainerTag: ') }}
    {{ Form::text('containerTag', null, ['class' => 'form-control', 'required']) }}
  </div>
  <div class="form-group">
    {{ Form::label(null, 'TitleTag') }}
    {{ Form::text('titleTag', null, ['class' => 'form-control', 'required']) }}
  </div>
  <div class="form-group">
    {{ Form::label(null, 'DescriptionTag') }}
    {{ Form::text('descriptionTag', null, ['class' => 'form-control']) }}
  </div>
  <div class="form-group">
    {{ Form::label(null, 'PubDateTag') }}
    {{ Form::text('pubDateTag', null, ['class' => 'form-control']) }}
  </div>
  <div class="form-group">
    {{ Form::label(null, 'Thuộc Tính Trong Thẻ PubDateTag') }}
    {{ Form::text('attr_pub_date', null, ['class' => 'form-control']) }}
  </div>
  <div class="form-group" >
    {{form::label('Active','Active:')}}
    <div class="form-check form-check-inline">
      {!! Form::radio('active',1, true, ['class' =>'form-check-input', 'id' => 'yes']) !!}
      {{Form::label('yes','Yes',['class'=>'form-check-label'])}}
     </div>
    <div class="form-check form-check-inline">
      {!!Form::radio('active',0, null, ['class' =>'form-check-input', 'id' => 'no'])!!}
      {{Form::label('no','No',['class'=>'form-check-label'])}}  
    </div>
  </div>
  <div class="form-group"> 
    {{ Form::submit('Submit', ['class' => 'btn btn-success']) }}
    {{ Form::button('Cancel', ['onclick' => 'history.go(-1)', 'class'=>'btn btn-danger']) }}
  </div>
{!! Form::close() !!}
@endsection
@section('css')
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
@endsection
@section('script')
<script type="text/javascript" src="vendor/select2/select2.min.js" ></script>
<script>
    $(document).ready(function(){
        $('select').select2();
    });
</script>
@endsection