<table id="example" cellspacing="0" width="100%">
  <thead>
    <tr>
        <th>Hôm Nay Có {{ $contents->toDayContentsCount }} Tin Mới</th>
    </tr>
  </thead>
  @foreach($contents as $content)
    <tr>
        <td style="padding-bottom: 15px">
          <h4 class="d-block" style="margin-bottom: 5px">
            <a class="btn-title" href="{!! $content->link !!}" title="{!! $content->title !!}">{!! $content->title !!}</a>
          </h4>
          <span class="d-block text-success">{!! $content->link !!}</span>
          <span class="d-block btn-image">{!! $content->description !!}</span>
          <span class="d-block">{!! $content->pubDate !!}</span>
        </td>
    </tr>
  @endforeach
  </tbody>
</table>
{{ $contents->render('pagination::bootstrap-4') }}