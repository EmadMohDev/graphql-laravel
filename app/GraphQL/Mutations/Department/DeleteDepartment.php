<?php
namespace App\GraphQL\Mutations\Department;

use App\Models\Department;
use Closure;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Definition\ResolveInfo;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Mutation;




class DeleteDepartment extends Mutation
{
    protected $attributes = [
        'name' => 'deleteDepartment',
        'description' => 'deletes a Department'
    ];

    public function type(): Type
    {
        return Type::boolean();
    }

    public function args(): array
    {
        return [
            'id' => [
                'name' => 'id',
                'type' => Type::int(),
                'rules' => ['required']
            ]
        ];
    }

    public function resolve($root, $args)
    {
        $category = Department::findOrFail($args['id']);

        return  $category->delete() ? true : false;
    }
}




