<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;

        /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['title', 'email', 'manager_id'];

    public function manager()
    {
        return $this->belongsTo(User::class, 'manager_id')->select('id', 'name');
    }



    public function users()
    {
        return $this->hasMany(User::class, 'department_id')->select('id', 'name', 'email');
    }

    public function slug()
    {
        return $this->title;
    }
}
