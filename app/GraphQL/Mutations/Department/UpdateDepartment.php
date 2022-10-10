<?php
namespace App\GraphQL\Mutations\Department;


use App\Models\Department;
use Closure;
use GraphQL\Type\Definition\Type;
use GraphQL\Type\Definition\ResolveInfo;
use Rebing\GraphQL\Support\Facades\GraphQL;
use Rebing\GraphQL\Support\Mutation;

class UpdateDepartment extends Mutation
{
    protected $attributes = [
        'name' => 'updateDepartment',  // this should be without space
        'description' => 'Updates a Department'
    ];

    public function type(): Type
    {
        return GraphQL::type('Department');
    }

    public function args(): array
    {
        return [
            'id' => [
                'name' => 'id',
                'type' =>  Type::nonNull(Type::int()),
            ],
            'title' => [
                'name' => 'title',
                'type' =>  Type::nonNull(Type::string()),
            ],
        ];
    }

    public function resolve($root, $args)
    {
        $Department = Department::findOrFail($args['id']);
        $Department->fill($args);
        $Department->save();

        return $Department;
    }
}
