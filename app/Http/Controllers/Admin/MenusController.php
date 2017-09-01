<?php

namespace Corp\Http\Controllers\Admin;

use Corp\Category;
use Corp\Filter;
use Corp\Http\Requests\MenusRequest;
use Corp\Repositories\ArticlesRepository;
use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Illuminate\Http\Request;
use Corp\Http\Controllers\Controller;
use Menu;

class MenusController extends AdminController
{
    protected $m_rep;

    /**
     * MenusController constructor.
     */
    public function __construct(MenusRepository $menusRepository,
                                ArticlesRepository $articlesRepository,
                                PortfoliosRepository $portfoliosRepository)
    {
        parent::__construct();

        $this->perm = 'VIEW_ADMIN_MENU';

        $this->m_rep = $menusRepository;
        $this->a_rep = $articlesRepository;
        $this->p_rep = $portfoliosRepository;

        $this->template = config('settings.theme').'.admin.menus';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authUser($this->perm);

        $menu = $this->getMenus();

        $this->content = view(config('settings.theme').'.admin.menus_content')->with('menus', $menu)->render();

        return $this->renderOutput();
    }

    protected function getMenus()
    {
        $menu = $this->m_rep->get();

        if ($menu->isEmpty()) {
            return false;
        }

        return Menu::make('forMenuPart', function ($m) use($menu) {

            foreach ($menu as $item) {
                if ($item->parent_id == 0) {
                    $m->add($item->title, $item->path)->id($item->id);
                } else {
                    if ($m->find($item->parent_id)) {
                        $m->find($item->parent_id)->add($item->title, $item->path)->id($item->id);
                    }
                }
            }

        });
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authUser($this->perm);

        $this->title = 'Новый пункт меню';

        $tmp = $this->getMenus()->roots();

        //null
        $menus = $tmp->reduce(function ($returnMenus, $menu) {

            $returnMenus[$menu->id] = $menu->title;
            return $returnMenus;

        }, ['0' => 'Родительский пункт меню']);

        $categories = Category::select(['title', 'alias', 'parent_id', 'id'])->get();

        $list = [];
        $list = array_add($list, '0', 'Не используется');
        $list = array_add($list, 'parent', 'Раздел блог');

        foreach ($categories as $category) {
            if ($category->parent_id == 0) {
                $list[$category->title] = [];
            } else {
                $list[$categories->where('id', $category->parent_id)->first()->title][$category->alias] = $category->title;
            }
        }

        $articles = $this->a_rep->get(['id', 'title', 'alias']);

        $articles = $articles->reduce(function ($returnArticles, $article) {

            $returnArticles[$article->alias] = $article->title;
            return $returnArticles;

        }, ['' => 'Не используется']);

        $filters = Filter::select(['id', 'title', 'alias'])->get()->reduce(function ($returnFilters, $filter) {

            $returnFilters[$filter->alias] = $filter->title;
            return $returnFilters;

        }, ['' => 'Не используется', 'parent' => 'Раздел портфолио']);

        $portfolios = $this->p_rep->get(['id', 'title', 'alias'])->reduce(function ($returnPortfolios, $portfolio) {

            $returnPortfolios[$portfolio->alias] = $portfolio->title;
            return $returnPortfolios;

        }, ['' => 'Не используется']);

        $this->content = view(config('settings.theme').'.admin.menus_create_content')->with([
            'menus' => $menus,
            'categories' => $list,
            'articles'   => $articles,
            'filters'    => $filters,
            'portfolios' => $portfolios
        ])->render();

        return $this->renderOutput();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(MenusRequest $request)
    {
        $result = $this->m_rep->addMenu($request);

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
    public function edit(\Corp\Menu $menu)
    {
        $this->authUser($this->perm);

        $this->title = 'Редактирование ссылки - ' . $menu->title;

        $type = false;
        $option = false;

        $route = app('router')->getRoutes()->match(app('request')->create($menu->path));

        $aliasRoute = $route->getName();
        $parameters = $route->parameters();

        /*dump($aliasRoute);
        dump($parameters);*/

        if ($aliasRoute == 'articlesIndex' || $aliasRoute == 'articlesCat') {
            $type = 'blogLink';
            $option = isset($parameters['cat_alias']) ? $parameters['cat_alias'] : 'parent';
        } elseif ($aliasRoute == 'articles.show') {
            $type = 'blogLink';
            $option = isset($parameters['alias']) ? $parameters['alias'] : '';
        } elseif ($aliasRoute == 'portfolios.index') {
            $type = 'portfolioLink';
            $option = 'parent';
        } elseif ($aliasRoute == 'portfolios.show') {
            $type = 'portfolioLink';
            $option = isset($parameters['alias']) ? $parameters['alias'] : '';
        } else {
            $type = 'customLink';
        }

//        dd($type);

        $tmp = $this->getMenus()->roots();

        //null
        $menus = $tmp->reduce(function ($returnMenus, $menu) {

            $returnMenus[$menu->id] = $menu->title;
            return $returnMenus;

        }, ['0' => 'Родительский пункт меню']);

        $categories = Category::select(['title', 'alias', 'parent_id', 'id'])->get();

        $list = [];
        $list = array_add($list, '0', 'Не используется');
        $list = array_add($list, 'parent', 'Раздел блог');

        foreach ($categories as $category) {
            if ($category->parent_id == 0) {
                $list[$category->title] = [];
            } else {
                $list[$categories->where('id', $category->parent_id)->first()->title][$category->alias] = $category->title;
            }
        }

        $articles = $this->a_rep->get(['id', 'title', 'alias']);

        $articles = $articles->reduce(function ($returnArticles, $article) {

            $returnArticles[$article->alias] = $article->title;
            return $returnArticles;

        }, ['' => 'Не используется']);

        $filters = Filter::select(['id', 'title', 'alias'])->get()->reduce(function ($returnFilters, $filter) {

            $returnFilters[$filter->alias] = $filter->title;
            return $returnFilters;

        }, ['' => 'Не используется', 'parent' => 'Раздел портфолио']);

        $portfolios = $this->p_rep->get(['id', 'title', 'alias'])->reduce(function ($returnPortfolios, $portfolio) {

            $returnPortfolios[$portfolio->alias] = $portfolio->title;
            return $returnPortfolios;

        }, ['' => 'Не используется']);

        $this->content = view(config('settings.theme').'.admin.menus_create_content')->with([
            'menu'      => $menu,
            'type'      => $type,
            'option'    => $option,
            'menus'     => $menus,
            'categories' => $list,
            'articles'   => $articles,
            'filters'    => $filters,
            'portfolios' => $portfolios
        ])->render();

        return $this->renderOutput();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(MenusRequest $request, \Corp\Menu $menu)
    {
        $result = $this->m_rep->updateMenu($request, $menu);

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
    public function destroy(\Corp\Menu $menu)
    {
        $result = $this->m_rep->deleteMenu($menu);

        if (is_array($result) && !empty($result['error'])) {
            return back()->with($result);
        }

        return redirect('/admin')->with($result);
    }
}
