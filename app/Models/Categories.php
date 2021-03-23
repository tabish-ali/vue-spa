<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    use HasFactory;
    protected $fillable = [
        'value',
        'text',
    ];

    public function getCreatedAtAttribute($value)
    {
        $newDate = date("F j, Y", strtotime($value));
        return $newDate;
    }
}
