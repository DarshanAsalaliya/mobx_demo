import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx_demo/model/album_model.dart';
import 'package:mobx_demo/model/comment_model.dart';
import 'package:mobx_demo/model/photos_model.dart';
import 'package:mobx_demo/model/posts_model.dart';
import 'package:mobx_demo/model/todo_model.dart';
import 'package:mobx_demo/model/user_model.dart';

class ApiService {
  final String postUrl = 'https://jsonplaceholder.typicode.com/posts';
  final String userUrl = 'https://jsonplaceholder.typicode.com/users';
  final String commentUrl = 'https://jsonplaceholder.typicode.com/comments';
  final String todoListUrl = 'https://jsonplaceholder.typicode.com/todos';
  final String albumListUrl = 'https://jsonplaceholder.typicode.com/albums';
  final String photoListUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Post>> getPosts(id) async {
    final response = await http.get(Uri.parse('$userUrl/$id/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Comment>> getPostComment(int id) async {
    final response = await http.get(Uri.parse('$postUrl/$id/comments'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<User>> authUser(String userid) async {
    final response = await http.get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<User> users =
          data.map((userJson) => User.fromJson(userJson)).toList();
      return users.where((element) => element.username == userid).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<Todo>> getTodoList(id) async {
    final response = await http.get(Uri.parse('$userUrl/$id/todos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((todo) => Todo.fromJson(todo)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Album>> getAlbumList(id) async {
    final response = await http.get(Uri.parse('$userUrl/$id/albums'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((album) => Album.fromJson(album)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Photo>> getPhotoList(int id) async {
    final response = await http.get(Uri.parse('$albumListUrl/$id/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((album) => Photo.fromJson(album)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
