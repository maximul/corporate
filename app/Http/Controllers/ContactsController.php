<?php

namespace Corp\Http\Controllers;

use Corp\Menu;
use Corp\Repositories\MenusRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactsController extends SiteController
{
    /**
     * ContactsController constructor.
     */
    public function __construct()
    {
        parent::__construct(new MenusRepository(new Menu()));

        $this->bar = 'left';
        $this->template = config('settings.theme').'.contacts';
    }

    public function index(Request $request)
    {
        if ($request->isMethod('post')) {

            $messages = [
                'required' => "Поле :attribute обязательно к заполнеию",
                'email' => "Поле :attribute должно соответствовать email адресу"
            ];

            $this->validate($request, [
                'name' => 'required|max:255',
                'email' => 'required|email',
                'text' => 'required'
            ], $messages);
            
            $data = $request->all();

            $result = Mail::send(config('settings.theme').'.email', ['data' => $data], function ($m) use ($data) {

                $mail_admin = config('settings.mail_admin');

                $m->from($data['email'], $data['name']);

                $m->to($mail_admin, 'Mr. Admin')->subject('Question');
            });

//            dd($result);

//            if ($result) {
                return redirect()->route('contacts')->with('status', 'Email is send');
//            }
        }
        
        $this->title = 'Контакты';

        $content = view(config('settings.theme').'.contact_content')->render();
        $this->vars = array_add($this->vars, 'content', $content);

        $this->contentLeftBar = view(config('settings.theme').'.contactBar')->render();

        return $this->renderOutput();
    }
}
