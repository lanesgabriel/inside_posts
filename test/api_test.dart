import 'package:flutter_test/flutter_test.dart';
import 'package:inside_posts/models/post.dart';
import 'package:inside_posts/services/api_service.dart';

void main() {
  group('ApiService Tests', () {
    late ApiService apiService;

    setUp(() {
      apiService = ApiService();
    });

    test('Fetch posts from API', () async {
      final posts = await apiService.fetchPosts();
      expect(posts, isA<List<Post>>());
      expect(posts.length, greaterThan(0));
    });

    test('Create a new post via API', () async {
      final post = Post(id: 0, title: 'Test Title', body: 'Test Body');
      final createdPost = await apiService.createPost(post);
      expect(createdPost, isA<Post>());
      expect(createdPost.title, 'Test Title');
      expect(createdPost.body, 'Test Body');
    });
  });
}
