<?php

namespace Corp\Http\Controllers\Admin;

use Corp\Http\Requests\UserRequest;
use Corp\Repositories\RolesRepository;
use Corp\Repositories\UsersRepository;
use Corp\Role;
use Corp\User;
use Illuminate\Http\Request;
use Corp\Http\Controllers\Controller;

class UsersController extends AdminController
{
    protected $us_rep;
    protected $rol_rep;

    /**
     * UsersController constructor.
     */
    public function __construct(RolesRepository $rolesRepository, UsersRepository $usersRepository)
    {
        parent::__construct();

        $this->perm = 'EDIT_USERS';

        $this->us_rep = $usersRepository;
        $this->rol_rep = $rolesRepository;

        $this->template = config('settings.theme').'.admin.users';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authUser($this->perm);

        $users = $this->us_rep->get();

        $this->content = view(config('settings.theme').'.admin.users_content')->with('users', $users)->render();

        return $this->renderOutput();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authUser($this->perm);

        $this->title = 'Новый пользователь';

        $roles = $this->getRoles()->reduce(function ($returnRoles, $role) {
            $returnRoles[$role->id] = $role->name;
            return $returnRoles;
        }, []);

        $this->content = view(config('settings.theme').'.admin.users_create_content')->with('roles', $roles)->render();

        return $this->renderOutput();
    }

    private function getRoles()
    {
        return Role::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UserRequest $request)
    {
        $result = $this->us_rep->addUser($request);

        if (is_array($result) && !empty($result['error'])) {
            return back()->with($result);
        }

        return redirect('/admin')->with($result);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        $this->authUser($this->perm);

        $this->title = 'Редактирование пользователя - ' . $user->name;

        $roles = $this->getRoles()->reduce(function ($returnRoles, $role) {
            $returnRoles[$role->id] = $role->name;
            return $returnRoles;
        }, []);

        $this->content = view(config('settings.theme').'.admin.users_create_content')->with(['roles' => $roles, 'user' => $user])->render();

        return $this->renderOutput();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UserRequest $request, User $user)
    {
        $result = $this->us_rep->updateUser($request, $user);

        if (is_array($result) && !empty($result['error'])) {
            return back()->with($result);
        }

        return redirect('/admin')->with($result);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $result = $this->us_rep->deleteUser($user);

        if (is_array($result) && !empty($result['error'])) {
            return back()->with($result);
        }

        return redirect('/admin')->with($result);
    }
}
