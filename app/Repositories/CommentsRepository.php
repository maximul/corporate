<?php
/**
 * Created by PhpStorm.
 * User: Max
 * Date: 14.08.2017
 * Time: 19:58
 */

namespace Corp\Repositories;

use Corp\Comment;

class CommentsRepository extends Repository
{
    /**
     * CommentsRepository constructor.
     */
    public function __construct(Comment $comment)
    {
        $this->model = $comment;
    }
}