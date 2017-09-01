<?php

namespace Corp\Http\Controllers;

use Corp\Menu;
use Corp\Repositories\ArticlesRepository;
use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Corp\Repositories\SlidersRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class IndexController extends SiteController
{
    /**
     * IndexController constructor.
     */
    public function __construct(SlidersRepository $slidersRepository,
                                PortfoliosRepository $portfoliosRepository, 
                                ArticlesRepository $articlesRepository)
    {
        parent::__construct(new MenusRepository(new Menu()));

        $this->s_rep = $slidersRepository;
        $this->p_rep = $portfoliosRepository;
        $this->a_rep = $articlesRepository;

        $this->bar = 'right';
        $this->template = config('settings.theme').'.index';
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $portfolios = $this->getPortfolio();

        $content = view(config('settings.theme').'.content')->with('portfolios', $portfolios)->render();
        $this->vars = array_add($this->vars, 'content', $content);

        $slidersItems = $this->getSliders();

        $sliders = view(config('settings.theme').'.slider')->with('sliders', $slidersItems)->render();
        $this->vars = array_add($this->vars, 'sliders', $sliders);

        $this->keywords = 'Home Page';
        $this->meta_desc = 'Home Page';
        $this->title = 'Home Page';

        $articles = $this->getArticles();

        $this->contentRightBar = view(config('settings.theme').'.indexBar')->with('articles', $articles)->render();

        return $this->renderOutput();
    }

    protected function getArticles()
    {
        $articles = $this->a_rep->get(['title', 'created_at', 'img', 'alias'], Config::get('settings.home_articles_count'), false, false, false, 'desc');

        return $articles;
    }

    protected function getPortfolio()
    {
        $portfolio = $this->p_rep->get('*', Config::get('settings.home_port_count'));

        return $portfolio;
    }

    protected function getSliders()
    {
        $sliders = $this->s_rep->get();

        if ($sliders->isEmpty()) {
            return false;
        }

        $sliders->transform(function ($item, $key) {

            $item->img = Config::get('settings.slider_path').'/'.$item->img;

            return $item;
        });

//        dd($sliders);

        return $sliders;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
