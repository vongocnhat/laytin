@extends('admin.layouts.default')
@section('title',"Kiem Tra")
@section('content')
<!-- Breadcrumbs-->
<div class="row">
  @if(Session::has('ketqua')) 
    <p class="alert alert-success">{{Session::get('ketqua')}}</p>
  @endif
</div>
      <!-- Example DataTables Card-->
<div class="card">
    <div class="card-header card-header-padding">
      <a href="{{route('content.create')}}" class="mr-2">
         <button class="btn btn-primary">
        <span class="far fa-address-book"></span>
           Create
         </button>
      </a>
      <a href="{{route('content.exportView')}}" class="btn btn-success">Xuất Excel</a>
      <div class="card-body card-body-padding">
        <div class="table-responsive">
        {!! Form::open(['method' => 'DELETE', 'route' => ['content.destroy', 'content' => 0]]) !!}
          {{ Form::submit('Delete', ['class' => 'btn btn-danger btnDelete btnDelete', 'onclick' => "return confirm('Xóa Tất Cả Nội Dung Được Checked Trong Trang Này ?')"]) }}
          <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th><input type="checkbox" class="parent-checkbox-delete"></th>
                <th>Id</th>
                <th>Tiêu Đề</th>
                <th>Ngày Đăng</th>
                <th>Nguồn Tin</th>
                <th>Phản Động</th>
                <th>Active</th>
                <th>Edit</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th><input type="checkbox" class="parent-checkbox-delete"></th>
                <th>Id</th>
                <th>Tiêu Đề</th>
                <th>Ngày Đăng</th>
                <th>Nguồn Tin</th>
                <th>Phản Động</th>
                <th>Active</th>
                <th>Edit</th>
              </tr>
            </tfoot>
            <tbody>
              @foreach($contents as $data)
              <tr>
                <td><input type="checkbox" class="checkbox-delete" name="idCheckbox[]" value="{{$data->id}}"></td>
                <td>{{$data->id}}</td>
                <td>{!!$data->title!!}</td>
                <td>{{$data->pubDate}}</td>
                <td>{{ $data->sourceOfNews }}</td>
                <td>{{$data->category->id == 1 ? 'Có' : 'Không'}}</td>
                <td>
                  <label><input type="checkbox" class="tdCbActive" value="{{ $data->id }}" {{$data->active ? 'checked="checked' : '' }}"><span>{{ $data->active ? ' Yes' : ' No' }}</span></label>
                </td>
                <td><a href="{{ URL::route('content.edit', ['content' => $data->id]) }}" class="btn btn-success">Edit</a></td>
              </tr>
              @endforeach

            </tbody>
          </table>
        {!! Form::close() !!}
</div>
</div>
</div>
</div>
@stop
@section('script')
<script>
    $(document).ready(function(){
      $('.tdCbActive').click(function() {
        var id = $(this).val();
        $.ajax({
          url: '{{ route('content.active') }}',
          data: {id: id}
        });
      });
    });
</script>
@endsection