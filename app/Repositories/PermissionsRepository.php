<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 27.08.2017
 * Time: 20:00
 */

namespace Corp\Repositories;


use Corp\Permission;
use Illuminate\Support\Facades\Gate;

class PermissionsRepository extends Repository
{
    protected $rol_rep;

    /**
     * PermissionsRepository constructor.
     */
    public function __construct(Permission $permission, RolesRepository $rolesRepository)
    {
        $this->model = $permission;
        $this->rol_rep = $rolesRepository;
    }

    public function changePermissions($request)
    {
        if (Gate::denies('change', $this->model)) {
            abort(403);
        }

        $data = $request->except('_token');

        $roles = $this->rol_rep->get();

        foreach ($roles as $role) {
            if (isset($data[$role->id])) {
                $role->savePermissions($data[$role->id]);
            } else {
                $role->savePermissions([]);
            }
        }

        return ['status' => 'Права обновлены'];
    }
}