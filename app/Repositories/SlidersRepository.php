<?php

namespace Corp\Repositories;

use Corp\Slider;

/**
 * Created by PhpStorm.
 * User: Max
 * Date: 10.08.2017
 * Time: 23:17
 */
class SlidersRepository extends Repository
{
    /**
     * MenusRepository constructor.
     */
    public function __construct(Slider $slider)
    {
        $this->model = $slider;
    }
}