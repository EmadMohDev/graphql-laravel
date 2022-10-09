<?php

namespace App\GraphQL\Type;

use App\Models\Post;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Type as GraphQLType;

class PostType extends GraphQLType
{
    protected $attributes = [
        'name'          => 'Post',
        'description'   => 'A Post',
        'model'         => Post::class,
    ];

    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::nonNull(Type::int()),
                'description' => 'The id of the user',
            ],
            'title' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'The name of post',
            ],
            'comment' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'The comment of the post'
            ],
        ];
    }
}
