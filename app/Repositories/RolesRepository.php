<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 27.08.2017
 * Time: 20:00
 */

namespace Corp\Repositories;


use Corp\Role;

class RolesRepository extends Repository
{
    /**
     * RolesRepository constructor.
     */
    public function __construct(Role $role)
    {
        $this->model = $role;
    }
}