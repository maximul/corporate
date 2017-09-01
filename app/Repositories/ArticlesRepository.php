<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 12.08.2017
 * Time: 17:26
 */

namespace Corp\Repositories;

use Corp\Article;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Gate;
use Intervention\Image\Facades\Image;

class ArticlesRepository extends Repository
{
    /**
     * ArticlesRepository constructor.
     */
    public function __construct(Article $article)
    {
        $this->model = $article;
    }

    public function one($alias, $attr = [])
    {
        $article = parent::one($alias, $attr); // TODO: Change the autogenerated stub

        if ($article && !empty($attr)) {
            $article->load('comments');
            $article->comments->load('user');
        }

        return $article;
    }

    public function addArticles(Request $request)
    {
        if (Gate::denies('save', $this->model)) {
            abort(403);
        }

        $data = $request->except('_token', 'image');

        if (empty($data)) {
            return ['error' => 'Нет данных'];
        }

        if (empty($data['alias'])) {
            $data['alias'] = $this->transliterate($data['title']);
        } else {
            $data['alias'] = $this->transliterate($data['alias']);
        }

        if ($this->one($data['alias'], false)) {
            $request->merge(['alias' => $data['alias']]);
            $request->flash();

            return ['error' => 'Данный псевдоним уже используется.'];
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');

            if ($image->isValid()) {

                $str = str_random(8);

                $obj = new \stdClass();

                $obj->mini = $str.'_mini.jpg';
                $obj->max = $str.'_max.jpg';
                $obj->path = $str.'.jpg';

                $img = Image::make($image);

                $img->fit(Config::get('settings.image')['width'], Config::get('settings.image')['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->path);

                $img->fit(Config::get('settings.articles_img')['max']['width'], Config::get('settings.articles_img')['max']['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->max);

                $img->fit(Config::get('settings.articles_img')['mini']['width'], Config::get('settings.articles_img')['mini']['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->mini);

                $data['img'] = json_encode($obj);

                $this->model->fill($data);

                if ($request->user()->articles()->save($this->model)) {
                    return ['status' => 'Материал добавлен'];
                }
            }
        }
    }

    public function updateArticles(Request $request, Article $article)
    {
        if (Gate::denies('edit', $article)) {
            abort(403);
        }

        $data = $request->except('_token', 'image', '_method');

        if (empty($data)) {
            return ['error' => 'Нет данных'];
        }

        if (empty($data['alias'])) {
            $data['alias'] = $this->transliterate($data['title']);
        } else {
            $data['alias'] = $this->transliterate($data['alias']);
        }

        $result = $this->one($data['alias'], false);

        if (isset($result->id) && ($result->id != $article->id)) {
            $request->merge(['alias' => $data['alias']]);
            $request->flash();

            return ['error' => 'Данный псевдоним уже используется.'];
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');

            if ($image->isValid()) {

                $str = str_random(8);

                $obj = new \stdClass();

                $obj->mini = $str.'_mini.jpg';
                $obj->max = $str.'_max.jpg';
                $obj->path = $str.'.jpg';

                $img = Image::make($image);

                $img->fit(Config::get('settings.image')['width'], Config::get('settings.image')['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->path);

                $img->fit(Config::get('settings.articles_img')['max']['width'], Config::get('settings.articles_img')['max']['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->max);

                $img->fit(Config::get('settings.articles_img')['mini']['width'], Config::get('settings.articles_img')['mini']['height'])
                    ->save(public_path().'/'.config('settings.theme').'/images/articles/'.$obj->mini);

                $data['img'] = json_encode($obj);
            }
        }

        $article->fill($data);

        if ($article->update()) {
            return ['status' => 'Материал обновлен'];
        }
    }

    public function deleteArticles(Article $article)
    {
        if (Gate::denies('destroy', $article)) {
            abort(403);
        }

        $article->comments()->delete();

        if ($article->delete()) {
            return ['status' => 'Материал удален'];
        }
    }
}