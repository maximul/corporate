<?php

namespace Corp\Http\Controllers\Admin;

use Corp\Article;
use Corp\Category;
use Corp\Http\Requests\ArticleRequest;
use Corp\Repositories\ArticlesRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class ArticlesController extends AdminController
{
    /**
     * ArticlesController constructor.
     */
    public function __construct(ArticlesRepository $articlesRepository)
    {
        parent::__construct();

        $this->perm = 'VIEW_ADMIN_ARTICLES';

        $this->a_rep = $articlesRepository;

        $this->template = config('settings.theme').'.admin.articles';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authUser($this->perm);

        $this->title = 'Менеджер статей';

        $articles = $this->getArticles();
        $this->content = view(config('settings.theme').'.admin.articles_content')->with('articles', $articles)->render();

        return $this->renderOutput();
    }

    protected function getArticles()
    {
        return $this->a_rep->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authUser($this->perm);

        if (Gate::denies('save', new Article())) {
            abort(403);
        }

        $this->title = 'Добавить новый материал';

        $categories = Category::select(['title', 'alias', 'parent_id', 'id'])->get();

        $lists = [];

        foreach ($categories as $category) {
            if ($category->parent_id == 0) {
                $lists[$category->title] = [];
            } else {
                $lists[$categories->where('id', $category->parent_id)->first()->title][$category->id] = $category->title;
            }
        }

        $this->content = view(config('settings.theme').'.admin.articles_create_content')->with('categories', $lists)->render();

        return $this->renderOutput();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ArticleRequest $request)
    {
        $result = $this->a_rep->addArticles($request);

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
    public function edit(Article $article)
    {
        $this->authUser($this->perm);

//        $article = Article::where('alias', $alias)->first();

        if (Gate::denies('edit', new Article())) {
            abort(403);
        }

        $article->img = json_decode($article->img);

        $this->title = 'Редактироваие материала - ' . $article->title;

        $categories = Category::select(['title', 'alias', 'parent_id', 'id'])->get();

        $lists = [];

        foreach ($categories as $category) {
            if ($category->parent_id == 0) {
                $lists[$category->title] = [];
            } else {
                $lists[$categories->where('id', $category->parent_id)->first()->title][$category->id] = $category->title;
            }
        }

        $this->content = view(config('settings.theme').'.admin.articles_create_content')->with(['categories' => $lists, 'article' => $article])->render();

        return $this->renderOutput();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ArticleRequest $request, Article $article)
    {
        $result = $this->a_rep->updateArticles($request, $article);

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
    public function destroy(Article $article)
    {
        $result = $this->a_rep->deleteArticles($article);

        if (is_array($result) && !empty($result['error'])) {
            return back()->with($result);
        }

        return redirect('/admin')->with($result);
    }
}
