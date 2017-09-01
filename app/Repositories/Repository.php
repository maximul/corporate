<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 10.08.2017
 * Time: 1:43
 */

namespace Corp\Repositories;

use Illuminate\Support\Facades\Config;

abstract class Repository
{
    protected $model = false;

    public function get($select = '*', $take = false, $pagination = false, $where = false, $sort = 'asc')
    {
        $builder = $this->model->select($select);

        if ($take) {
            $builder->take($take);
        }

        if ($where) {
            $builder->where($where[0], $where[1]);
        }

        if ($pagination) {
            return $this->check($builder->paginate(Config::get('settings.paginate')));
        }

        return $this->check($builder->orderBy('created_at', $sort)->get());
    }

    protected function check($result)
    {
        if ($result->isEmpty()) {
            return false;
        }

        $result->transform(function ($item, $key) {

            if (is_string($item->img) && is_object(json_decode($item->img)) && json_last_error() == JSON_ERROR_NONE)
                $item->img = json_decode($item->img);

            return $item;
        });

        return $result;
    }

    public function one($alias, $attr = [])
    {
        $result = $this->model->where('alias', $alias)->first();

        return $result;
    }

    public function transliterate($string)
    {
        $str = mb_strtolower($string, 'UTF-8');

        $leter_array = [
            'a' => 'а',
            'b' => 'б',
            'v' => 'в',
            'g' => 'г',
            'd' => 'д',
            'e' => 'е,э',
            'jo' => 'ё',
            'zh' => 'ж',
            'z' => 'з',
            'i' => 'и',
            'j' => 'й',
            'k' => 'к',
            'l' => 'л',
            'm' => 'м',
            'n' => 'н',
            'o' => 'о',
            'p' => 'п',
            'r' => 'р',
            's' => 'с',
            't' => 'т',
            'u' => 'у',
            'f' => 'ф',
            'kh' => 'х',
            'ts' => 'ц',
            'ch' => 'ч',
            'sh' => 'ш',
            'shch' => 'щ',
            '' => 'ъ,ь',
            'y' => 'ы',
            'ju' => 'ю',
            'ja' => 'я'
        ];

        foreach ($leter_array as $later => $kyr) {

            $kyr = explode(',', $kyr);

            $str = str_replace($kyr, $later, $str);
        }

        $str = preg_replace('/(\s|[^\w\-])+/', '-', $str);

        $str = trim($str, '-');

        return $str;
    }
}