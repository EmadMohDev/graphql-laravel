<?php

// https://www.freecodecamp.org/news/build-a-graphql-api-using-laravel/
namespace App\GraphQL\Query;

use App\Models\Post;
use Closure;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Query;

class PostsQuery extends Query
{
    protected $attributes = [
        'name' => 'posts',
    ];

    public function type(): Type
    {
        return Type::listOf(GraphQL::type('Post'));
    }

    public function resolve($root, array $args, $context, ResolveInfo $info, Closure $getSelectFields)
    {
        $fields = $getSelectFields();
        return Post::select($fields->getSelect())->with($fields->getRelations())->get();
    }



    public function resolve222($root, $args)
    {
        if (isset($args['id'])) {
            return Post::whereId($args['id'])->get();
        }

        if (isset($args['title'])) {
            return Post::whereTitle($args['title'])->get();
        }

        return Post::all();
    }

}
