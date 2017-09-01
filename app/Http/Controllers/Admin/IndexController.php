<?php

namespace Corp\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IndexController extends AdminController
{
    /**
     * IndexController constructor.
     */
    public function __construct()
    {
        parent::__construct();

        $this->perm = 'VIEW_ADMIN';

        $this->template = config('settings.theme').'.admin.index';
    }

    public function index()
    {
        $this->authUser($this->perm);

        $this->title = 'Панель администратора';

        return $this->renderOutput();
    }
}
