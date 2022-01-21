import 'package:dio/dio.dart';
import 'package:test_coding/model/post.dart';

const String _baseURL = 'https://jsonplaceholder.typicode.com';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseURL,
      sendTimeout: 30000,
      connectTimeout: 30000,
    ),
  );

  Future<List<Post>?> fetchPosts() async {
    try {
      Response response = await _dio.get('/posts');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => Post.fromJson(e)).toList();
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<Post?> postDetail({int? id}) async {
    try {
      Response response = await _dio.get('/posts/$id');

      if (response.statusCode == 200) {
        Post posts = Post.fromJson(response.data);
        return posts;
      }
    } catch (e) {
      e.toString();
    }
  }
}
