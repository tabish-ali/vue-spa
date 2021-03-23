<?php

namespace App\Http\Controllers;

use App\Models\Categories;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    public function addCategory(Request $request)
    {
        $category = ['value' => $request->category, 'text' => ucfirst($request->category)];
        Categories::create($category);
    }

    // for table in categories menu
    public function getCategories()
    {
        $categories = Categories::orderBy('id', 'desc')->paginate(10);
        return response()->json($categories);
    }

    //for drop down
    public function getCategoriesDropdown()
    {
        $categories = Categories::orderBy('id', 'desc')->get();
        return response()->json($categories);
    }

    public function deleteCategory(Request $request)
    {
        $id = $request->id;
        $category = Categories::find($id);
        $category->delete();
        return ["success"];
    }
    public function deleteCategories(Request $request)
    {
        foreach ($request->categories as $category) {
            $id = $category['id'];
            $deleted_category = Categories::find($id);
            if ($deleted_category)
                $deleted_category->delete();
        }
        return ['success'];
    }
}
