<?php


namespace App\GraphQL\Mutations\Department;


use App\Models\Department;
use Closure;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Definition\ResolveInfo;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Mutation;




class CreateDepartment extends Mutation
{
    protected $attributes = [
        'name' => 'createDepartmnet',
        'description' => 'Creates a Departmnet'
    ];

    public function type(): Type
    {
        return GraphQL::type('Department');
    }

    public function args(): array
    {
        return [
            'title' => [
                'name' => 'title',
                'type' =>  Type::nonNull(Type::string()),
            ],

            'email' => [
                'type' => Type::nonNull(Type::string()),
                'type' =>  Type::nonNull(Type::string()),
            ] ,


            'user' => [
                'type' => Type::nonNull(Type::int()),
                'description' => 'user id ' ,
                'rules' => ['exists:users,id']  // validition
            ] ,
        ];
    }

    public function resolve($root, $args)
    {
        $Department = new Department();
        $Department->fill($args);
        $Department->save();

        return $Department;
    }
}
