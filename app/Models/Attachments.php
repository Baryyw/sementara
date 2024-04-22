<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attachments extends Model
{
    use HasFactory;

    protected $table = 'post_attachments';

    public $timestamps = false;
    // protected $fillable = ['storage_path'];
    protected $hidden = ['posts_id', 'created_at', 'updated_at'];
    protected $fillable = [
        'storage_path',
        'posts_id'
    ];
    public function post()
    {
        return $this->belongsTo(Post::class, 'posts_id'); 
    }
}
