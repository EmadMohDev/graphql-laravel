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


    // we should add this to can filter with args
    public function args(): array
    {

        return [
            'id' => [
                'type' => Type::int(),
                'description' => 'The id of the post',
            ],
            'title' => [
                'type' => Type::string(),
                'description' => 'The name of post',
            ],
            'comment' => [
                'type' => Type::string(),
                'description' => 'The comment of the post'
            ],
        ];
    }


    public function resolve_old($root, array $args, $context, ResolveInfo $info, Closure $getSelectFields)
    {
        $fields = $getSelectFields();
        return Post::select($fields->getSelect())->with($fields->getRelations())->get();
    }



    public function resolve($root, $args)
    {

        /*
        // this filter with id  OR  title
        if (isset($args['id'])) {
            return Post::whereId($args['id'])->get();
        }

        if (isset($args['title'])) {
            return Post::whereTitle($args['title'])->get();
        }

        return Post::all();
        */


        // this filter with  all args parameters [ id  /  title  /  comment]
        return Post::where($args)->get();
    }

}





