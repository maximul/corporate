<?php

namespace Corp\Http\Controllers\Admin;

use Illuminate\Support\Facades\Gate;
use Menu;
use Illuminate\Http\Request;
use Corp\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    protected $p_rep;
    protected $a_rep;
    protected $user;
    protected $template;
    protected $content = false;
    protected $title;
    protected $vars;
    protected $perm;

    /**
     * AdminController constructor.
     */
    public function __construct()
    {
        //
    }

    public function renderOutput()
    {
        $this->vars = array_add($this->vars, 'title', $this->title);

        $menu = $this->getMenu();

        $navigation = view(config('settings.theme').'.admin.navigation')->with('menu', $menu)->render();
        $this->vars = array_add($this->vars, 'navigation', $navigation);

        if ($this->content) {
            $this->vars = array_add($this->vars, 'content', $this->content);
        }

        $footer = view(config('settings.theme').'.admin.footer')->render();
        $this->vars = array_add($this->vars, 'footer', $footer);

        return view($this->template)->with($this->vars);
    }

    public function getMenu()
    {
        return Menu::make('adminMenu', function ($menu) {

            if (Gate::allows('VIEW_ADMIN_ARTICLES')) {
                $menu->add('Статьи', ['route' => 'articles.index']);
                $menu->add('Портфолио', ['route' => 'articles.index']);
            }

            if (Gate::allows('VIEW_ADMIN_MENU')) {
                $menu->add('Меню', ['route' => 'menus.index']);
            }

            if (Gate::allows('EDIT_USERS')) {
                $menu->add('Пользователи', ['route' => 'users.index']);
                $menu->add('Привелегии', ['route' => 'permissions.index']);
            }

        });
    }

    public function authUser($p)
    {
        $this->user = Auth::user();

//        dd($this->user);

        if (!$this->user) {
            abort(403);
        }

        if (Gate::denies($p)) {
            abort(403);
        }
    }
}
