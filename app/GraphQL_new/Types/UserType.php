<?php

namespace App\GraphQL\Types;

use App\Models\User;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Type as GraphQLType;

class UserType extends GraphQLType
{
    protected $attributes = [
        'name' => 'User',
        'description' => 'Collection of users',
        'model' => User::class
    ];

    public function fields(): array
    {
        return [
            'id' => [
                'type' => Type::nonNull(Type::int()),
                'description' => 'ID of user'
            ],
            'name' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'Name of the User'
            ],
            'email' => [
                'type' => Type::nonNull(Type::string()),
                'description' => 'Email of user'
            ],
            'department' => [
                'type' => Type::listOf(GraphQL::type('Department')),
                'description' => 'The user Department',
                'always' => ['title'],
            ]
        ];
    }
}