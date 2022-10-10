<?php

namespace App\GraphQL\Query;

use App\Models\User;
use Closure;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Query;

class UserQuery extends Query
{
    protected $attributes = [
        'name' => 'user',
    ];

    public function type(): Type
    {
        return GraphQL::type('User');
    }

    public function args(): array
    {
        return [
            'id' => [
                'name' => 'id',
                'type' => Type::int()
            ],
            'name' => [
                'name' => 'name',
                'type' => Type::string()
            ],
            'email' => [
                'name' => 'email',
                'type' => Type::string()
            ]
        ];
    }

    public function resolve($root, array $args, $context, ResolveInfo $info, Closure $getSelectFields)
    {

        /* // to can filter only with id
        $fields = $getSelectFields();
        return User::select($fields->getSelect())->with($fields->getRelations())->find($args['id']);
        */


        $fields = $getSelectFields();
        $query = User::select($fields->getSelect())->with($fields->getRelations()) ;
        foreach($args as $key=>$value){
            $query->where($key, $value) ;
        }
        return  $query->first() ;




    }
}

