<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RSS extends Model
{
    //
    protected $fillable = [
        'category_id', 'link', 'ignoreRSS', 'website'
    ];
    public $timestamps = false;

    public function category()
    {
    	return $this->belongsTo('App\Category');
    }
}
