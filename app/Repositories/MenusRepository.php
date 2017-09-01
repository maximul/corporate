<?php

namespace Corp\Repositories;

use Corp\Menu;
use Illuminate\Support\Facades\Gate;

/**
 * Created by PhpStorm.
 * User: Max
 * Date: 10.08.2017
 * Time: 1:44
 */
class MenusRepository extends Repository
{
    /**
     * MenusRepository constructor.
     */
    public function __construct(Menu $menu)
    {
        $this->model = $menu;
    }

    public function addMenu($request)
    {
        if (Gate::denies('save', $this->model)) {
            abort(403);
        }

        $data = $request->only('type', 'title', 'parent_id');

        if (empty($data)) {
            return ['error' => 'Нет данных'];
        }

//        dd($request->all());

        switch ($data['type']) {

            case 'customLink':
                $data['path'] = $request->input('custom_link');
                break;

            case 'blogLink':

                if ($request->input('category_alias')) {
                    if ($request->input('category_alias') == 'parent') {
                        $data['path'] = route('articlesIndex');
                    } else {
                        $data['path'] = route('articlesCat', ['cat_alias' => $request->input('category_alias')]);
                    }
                } elseif ($request->input('article_alias')) {
                    $data['path'] = route('articles.show', ['alias' => $request->input('article_alias')]);
                }
                break;

            case 'portfolioLink':

                if ($request->input('filter_alias')) {
                    if ($request->input('filter_alias') == 'parent') {
                        $data['path'] = route('portfolios.index');
                    }
                } elseif ($request->input('portfolio_alias')) {
                    $data['path'] = route('portfolios.show', ['alias' => $request->input('portfolio_alias')]);
                }
                break;

            default:
                return ['error' => 'Ничего не добавлено'];
        }

        unset($data['type']);

        if ($this->model->fill($data)->save()) {
            return ['status' => 'Ссылка добавлена'];
        }
    }

    public function updateMenu($request, $menu)
    {
        if (Gate::denies('edit', $this->model)) {
            abort(403);
        }

        $data = $request->only('type', 'title', 'parent_id');

        if (empty($data)) {
            return ['error' => 'Нет данных'];
        }

//        dd($request->all());

        switch ($data['type']) {

            case 'customLink':
                $data['path'] = $request->input('custom_link');
                break;

            case 'blogLink':

                if ($request->input('category_alias')) {
                    if ($request->input('category_alias') == 'parent') {
                        $data['path'] = route('articlesIndex');
                    } else {
                        $data['path'] = route('articlesCat', ['cat_alias' => $request->input('category_alias')]);
                    }
                } elseif ($request->input('article_alias')) {
                    $data['path'] = route('articles.show', ['alias' => $request->input('article_alias')]);
                }
                break;

            case 'portfolioLink':

                if ($request->input('filter_alias')) {
                    if ($request->input('filter_alias') == 'parent') {
                        $data['path'] = route('portfolios.index');
                    }
                } elseif ($request->input('portfolio_alias')) {
                    $data['path'] = route('portfolios.show', ['alias' => $request->input('portfolio_alias')]);
                }
                break;

            default:
                return ['error' => 'Ничего не обновлено'];
        }

        unset($data['type']);

        if ($menu->fill($data)->update()) {
            return ['status' => 'Ссылка обновлена'];
        }
    }

    public function deleteMenu($menu)
    {
        if (Gate::denies('destroy', $this->model)) {
            abort(403);
        }

        if ($menu->delete()) {
            return ['status' => 'Ссылка удалена'];
        }
    }
}