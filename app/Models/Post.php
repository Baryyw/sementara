<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $table = 'posts';
    protected $hidden = ['updated_at'];
    protected $fillable = [
        'caption',
        'user_id',
    ];    
    public function attachments()
    {
        return $this->hasMany(Attachments::class, 'posts_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
