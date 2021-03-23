<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Exception;
use Illuminate\Http\Request;
use Intervention\Image\ImageManagerStatic as Image;

class ArticlesController extends Controller
{
    public function postArticle(Request $request)
    {
        //saving image
        $article_image_name = ArticlesController::getImage($request->image);
        // getting youtube link and tag from it to get the thumbnail 
        $article = json_decode($request->article);
        $link = $article->link;
        $youtube = ArticlesController::getLink($link);

        // preparing article to be saved in database
        $article = [
            "title" => $article->title,
            "tags" => $article->tags,
            "youtube_id" => $youtube['youtube_id'],
            "link" => $link,
            "youtube_img" => $youtube['youtube_img'],
            "content" => $article->content,
            "category" => $article->category,
            "image" => $article_image_name,
        ];
        // dd($article);
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
        $articles = Article::paginate(2);
        return response()->json($articles);
    }

    public function getArticle()
    {
        $id = $_GET['id'];
        $article = Article::find($id);
        return response()->json($article);
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

    public static function getLink($link)
    {
        if ($link) {
            parse_str(parse_url($link, PHP_URL_QUERY), $vars_array);
            if (array_key_exists('v', $vars_array)) {
                $youtube_id = $vars_array['v'];
                $youtube_img = "https://img.youtube.com/vi/" . $youtube_id . "/0.jpg";
            } else {
                $youtube_id = "";
                $youtube_img = "";
            }
        }
        return ['youtube_id' => $youtube_id, 'youtube_img' => $youtube_img];
    }

    public static function getImage($image)
    {
        if ($image) {
            $client_name = $image->getClientOriginalName();
            $image = Image::make($image)->fit(330, 480);
            $path = storage_path('app');
            $image_name = strtotime(date('Y/m/d H:i:s')) . '-' . $client_name;
            $image_path = $path . '/public/uploads/'  . $image_name;
            $image->save($image_path, 100);
        } else {
            $image_name = "";
        }
        return $image_name;
    }

    public function updateArticle(Request $request)
    {
        $article =  json_decode($request->article);

        $db_article = Article::find($article->id);

        $db_article->title = $article->title;
        $db_article->tags = $article->tags;
        $db_article->link = $article->link;
        $db_article->content = $article->content;
        $db_article->category = $article->category;

        // deleting old image
        try {
            $path = storage_path('app');
            $old_image_path = $path . '/public/uploads/' . $db_article->image;
            unlink($old_image_path);
        } catch (Exception $e) {
        }

        if ($request->hasFile(('image'))) {
            $article_image_name = ArticlesController::getImage($request->image);
            $db_article->image = $article_image_name;
        }

        $youtube =  ArticlesController::getLink($article->link);
        $db_article->youtube_id = $youtube['youtube_id'];
        $db_article->youtube_img = $youtube['youtube_img'];

        $db_article->save();

        return ['message' => 'success'];
    }
}
