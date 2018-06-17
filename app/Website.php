<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Website extends Model
{
    //
    protected $fillable = [
        'category_id', 'domainName', 'menuTag', 'numberPage', 'limitOfOnePage', 'stringFirstPage', 'stringLastPage', 'ignoreWebsite', 'active'
    ];
    
    public function detailWebsites()
    {
    	// return $this->hasMany( ‘TenModel’ , ‘KhoaPhu’, ‘KhoaChinh’ );
    	return $this->hasMany('App\DetailWebsite');
    }

    public function category()
    {
    	return $this->belongsTo('App\Category');
    }

    public $timestamps = false;
}
