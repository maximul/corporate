<?php

namespace Corp;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    //
    protected $fillable = [
        'title', 'path', 'parent_id'
    ];

    public function delete(array $options = [])
    {
        self::where('parent_id', $this->id)->delete();

        return parent::delete($options);
    }
}
