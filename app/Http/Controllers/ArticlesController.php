<?php

namespace Corp\Http\Controllers;

use Corp\Category;
use Corp\Menu;
use Corp\Repositories\ArticlesRepository;
use Corp\Repositories\CommentsRepository;
use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Illuminate\Http\Request;

class ArticlesController extends SiteController
{
    /**
     * ArticlesController constructor.
     */
    public function __construct(PortfoliosRepository $portfoliosRepository,
                                ArticlesRepository $articlesRepository,
                                CommentsRepository $commentsRepository)
    {
        parent::__construct(new MenusRepository(new Menu()));

        $this->p_rep = $portfoliosRepository;
        $this->a_rep = $articlesRepository;
        $this->c_rep = $commentsRepository;

        $this->bar = 'right';
        $this->template = config('settings.theme').'.articles';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($cat_alias = false)
    {

        $this->title = 'Блог';
        $this->keywords = 'String';
        $this->meta_desc = 'String';

        $articles = $this->getArticles($cat_alias);

        $content = view(config('settings.theme').'.articles_content')->with('articles', $articles)->render();
        $this->vars = array_add($this->vars, 'content', $content);

        $comments = $this->getComments(config('settings.resent_comments'));
        $portfolios = $this->getPortfolios(config('settings.resent_portfolios'));

        $this->contentRightBar = view(config('settings.theme').'.articlesBar')->with(['comments' => $comments, 'portfolios' => $portfolios])->render();

        return $this->renderOutput();
    }

    protected function getComments($take)
    {

        $comments = $this->c_rep->get(['text', 'name', 'email', 'site', 'article_id', 'user_id'], $take);

        if ($comments) {
            $comments->load('article', 'user');
        }

        return $comments;
    }

    protected function getPortfolios($take)
    {

        $portfolios = $this->p_rep->get(['title', 'text', 'alias', 'customer', 'img', 'filter_alias'], $take);

        return $portfolios;
    }

    protected function getArticles($alias = false)
    {
        $where = false;

        if ($alias) {
            // WHERE `alias` = $alias
            $id = Category::select('id')->where('alias', $alias)->first()->id;
            // WHERE `category_id` = $id
            $where = ['category_id', $id];
        }

        $articles = $this->a_rep->get(['id', 'title', 'alias', 'created_at', 'img', 'desc', 'user_id', 'category_id', 'keywords', 'meta_desc'], false, true, $where);

        if ($articles) {
            $articles->load('user', 'category', 'comments');
        }

        return $articles;
    }

    public function show($alias = false)
    {
        $article = $this->a_rep->one($alias, ['comments' => true]);

        if ($article) {
            $article->img = json_decode($article->img);
        }

//        dd($article->comments->groupBy('parent_id'));

        if ($article) {
            $this->title = $article->title;
            $this->keywords = $article->keywords;
            $this->meta_desc = $article->meta_desc;
        }

        $content = view(config('settings.theme').'.article_content')->with('article', $article)->render();
        $this->vars = array_add($this->vars, 'content', $content);

        $comments = $this->getComments(config('settings.resent_comments'));
        $portfolios = $this->getPortfolios(config('settings.resent_portfolios'));

        $this->contentRightBar = view(config('settings.theme').'.articlesBar')->with(['comments' => $comments, 'portfolios' => $portfolios])->render();

        return $this->renderOutput();
    }
}
