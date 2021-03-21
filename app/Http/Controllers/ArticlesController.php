<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;
use Monolog\Handler\PushoverHandler;

class ArticlesController extends Controller
{
    public function postArticle(Request $request)
    {
        if ($request->hasFile('image')) {
            $article_image_name = $request->image->getClientOriginalName();
            $image = Image::make($request->image)->fit(185, 275);
            $path = storage_path('app');
            $image->save($path . '/public/uploads/' . $article_image_name, 100);
        } else {
            $article_image_name = "";
        }
        $article = json_decode($request->article);

        $youtube_link = "https://youtu.be/" . $article->youtubeId;
        $youtube_img = "https://img.youtube.com/vi/" . $article->youtubeId . "/0.jpg";

        $article = [
            "title" => $article->title,
            "tags" => $article->tags,
            "youtube_id" => $article->youtubeId,
            "youtube_link" => $youtube_link,
            "youtube_img" => $youtube_img,
            "content" => $article->content,
            "category" => $article->category,
            "image" => $article_image_name,
            "external_image" => $article->externalImage
        ];
        Article::create($article);

        return  ["message" => "success"];
    }
    // used for display articles in listarticles.vue table
    public function getArticles()
    {
        $articles = Article::paginate(10);
        return response()->json($articles);
    }

    // used for display articles on home page
    public function index()
    {
        // $page = $_GET['page'];
        // $per_page = $_GET['per_page'];
        // $offset = ($page - 1) * $per_page + 1;
        // $articles = Article::skip($offset-1)->take(($page * $per_page))->get();
        $articles = Article::paginate(2);
        return response()->json($articles);
    }

    public function deleteArticles(Request $request)
    {

        foreach ($request->articles as $article) {
            $id = $article['id'];
            $deleted_article = Article::find($id);
            if ($deleted_article)
                $deleted_article->delete();
        }
        return ['success'];
    }

    public function deleteArticle(Request $request)
    {
        $id = $request->id;
        $article = Article::find($id);
        $article->delete();
        return ["success"];
    }
}
