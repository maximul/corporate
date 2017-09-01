<?php

namespace Corp\Http\Controllers;

use Corp\Menu;
use Corp\Repositories\MenusRepository;
use Corp\Repositories\PortfoliosRepository;
use Illuminate\Http\Request;

class PortfolioController extends SiteController
{
    /**
     * PortfolioController constructor.
     */
    public function __construct(PortfoliosRepository $portfoliosRepository)
    {
        parent::__construct(new MenusRepository(new Menu()));

        $this->p_rep = $portfoliosRepository;

        $this->template = config('settings.theme').'.portfolios';
    }

    public function index()
    {
        $this->title = 'Портфолио';
        $this->keywords = 'Портфолио';
        $this->meta_desc = 'Портфолио';

        $portfolios = $this->getPortfolios();

        $content = view(config('settings.theme').'.portfolios_content')->with('portfolios', $portfolios)->render();
        $this->vars = array_add($this->vars, 'content', $content);

        return $this->renderOutput();
    }

    protected function getPortfolios($take = false, $paginate = true)
    {
        $portfolios = $this->p_rep->get('*', $take, $paginate);

        if ($portfolios) {
            $portfolios->load('filter');
        }

        return $portfolios;
    }

    public function show($alias)
    {
        $portfolio = $this->p_rep->one($alias);
        $portfolios = $this->getPortfolios(config('settings.other_portfolios'), false);

        $this->title = $portfolio->title;
        $this->keywords = $portfolio->keywords;
        $this->meta_desc = $portfolio->meta_desc;

        $content = view(config('settings.theme').'.portfolio_content')->with(['portfolio' => $portfolio, 'portfolios' => $portfolios])->render();
        $this->vars = array_add($this->vars, 'content', $content);


        return $this->renderOutput();
    }
}
