<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    use HasFactory;
    protected $dates = ['created_at, updated_at'];
    protected $fillable = [
        'title',
        'tags',
        'youtube_id',
        'content',
        'image',
        'category',
        'external_image',
        'youtube_link',
        'youtube_img',
    ];

    public function getCreatedAtAttribute($value)
    {
        $newDate = date("F j, Y, g:i a", strtotime($value));
        return $newDate;
    }
}
