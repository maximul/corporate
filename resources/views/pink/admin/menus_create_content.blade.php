<div id="content-page" class="content group">
    <div class="hentry group">

        {!! Form::open([
            'url' => (isset($menu->id)) ? route('menus.update', ['menus' => $menu->id]) : route('menus.store'),
            'class' => 'contact-form',
            'method' => 'POST',
            'enctype' => 'multipart/form-data'
        ]) !!}

        <ul>
            <li class="text-field">
                <label for="name-contact-us">
                    <span class="label">Заголовок:</span>
                    <br>
                    <span class="sublabel">Заголовок пункта</span><br>
                </label>
                <div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
                    {!! Form::text('title', isset($menu->title) ? $menu->title : old('title'), ['placeholder' => 'Введите название пункта меню']) !!}
                </div>
            </li>

            <li class="text-field">
                <label for="name-contact-us">
                    <span class="label">Родительский пункт меню:</span>
                    <br>
                    <span class="sublabel">Родитель:</span><br>
                </label>
                <div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
                    {!! Form::select('parent_id', $menus, isset($menu->parent_id) ? $menu->parent_id : null) !!}
                </div>
            </li>
        </ul>

        <h1>Тип меню:</h1>

        <div id="accordion">
            <h3>{!! Form::radio('type', 'customLink', (isset($type) && $type == 'customLink') ? true : false, ['class' => 'radio']) !!}
                <span class="label">Пользовательская ссылка:</span>
            </h3>

            <ul>
                <li class="text-field">
                    <label for="name-contact-us">
                        <span class="label">Путь для ссылки:</span>
                        <br>
                        <span class="sublabel">Путь для ссылки</span><br>
                    </label>
                    <div class="input-prepend"><span class="add-on"><i class="icon-user"></i></span>
                        {!! Form::text('custom_link', (isset($menu->path) && $type == 'customLink') ? $menu->path : false, ['placeholder' => 'Введите название ссылки']) !!}
                    </div>
                </li>
                <div style="clear: both"></div>
            </ul>

            <h3>{!! Form::radio('type', 'blogLink', (isset($type) && $type == 'blogLink') ? true : false, ['class' => 'radio']) !!}
                <span class="label">Раздел Блог:</span>
            </h3>

            <ul>
                <li class="text-field">
                    <label for="name-contact-us">
                        <span class="label">Ссылка на категорию блога:</span>
                        <br>
                        <span class="sublabel">Ссылка на категорию блога</span><br>
                    </label>
                    <div class="input-prepend">

                        @if($categories)
                            {!! Form::select('category_alias', $categories, (isset($option) && $option) ? $option : false) !!}
                        @endif
                    </div>
                </li>

                <li class="text-field">
                    <label for="name-contact-us">
                        <span class="label">Ссылка на материал блога:</span>
                        <br>
                        <span class="sublabel">Ссылка на материал блога</span><br>
                    </label>
                    <div class="input-prepend">
                        {!! Form::select('article_alias', $articles, (isset($option) && $option) ? $option : null) !!}
                    </div>
                </li>
                <div style="clear: both"></div>
            </ul>

            <h3>{!! Form::radio('type', 'portfolioLink', (isset($type) && $type == 'portfolioLink') ? true : false) !!}
                <span class="label">Раздел портфолио:</span>
            </h3>

            <ul>
                <li class="text-field">
                    <label for="name-contact-us">
                        <span class="label">Ссылка на запись портфолио:</span>
                        <br>
                        <span class="sublabel">Ссылка на запись портфолио</span><br>
                    </label>
                    <div class="input-prepend">
                        {!! Form::select('portfolio_alias', $portfolios, (isset($option) && $option) ? $option : null) !!}
                    </div>
                </li>

                <li class="text-field">
                    <label for="name-contact-us">
                        <span class="label">Портфолио:</span>
                        <br>
                        <span class="sublabel">Портфолио</span><br>
                    </label>
                    <div class="input-prepend">
                        {!! Form::select('filter_alias', $filters, (isset($option) && $option) ? $option : null) !!}
                    </div>
                </li>
                <div style="clear: both"></div>
            </ul>
        </div>

        <br>

        @if(isset($menu->id))
            {{ method_field('PUT') }}
        @endif

        <ul>
            <li class="submit-button">
                {!! Form::button('Сохранить', ['class' => 'btn btn-the-salmon-dance-3', 'type' => 'submit']) !!}
            </li>
        </ul>

        {!! Form::close() !!}

    </div>
</div>

<script>

    jQuery(function ($) {

        $('#accordion').accordion({

            activate: function (e, obj) {
                obj.newPanel.prev().find('input[type=radio]').attr('checked', 'checked');
            }

        });

        var active = 0;
        $('#accordion input[type=radio]').each(function (ind, it) {

            if ($(this).prop('checked')) {
                active = ind;
            }

        });

        $('#accordion').accordion('option', 'active', active);

    })

</script>