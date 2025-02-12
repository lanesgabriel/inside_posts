import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';
import '../services/api_service.dart';

class PostProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  bool _isLoading = false;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;

  // Save posts in SharedPreferences
  Future<void> _savePostsToLocal(List<Post> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final postsJson = posts.map((post) => post.toJson()).toList();
    await prefs.setString('posts', jsonEncode(postsJson));
  }

  // Load posts from SharedPreferences
  Future<List<Post>> _loadPostsFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final postsJson = prefs.getString('posts');

    if (postsJson != null) {
      final List<dynamic> jsonList = jsonDecode(postsJson);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    }

    return [];
  }

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Load posts from API
      _posts = await _apiService.fetchPosts();

      await _savePostsToLocal(_posts);
    } catch (e) {
      _posts = await _loadPostsFromLocal();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addPost(Post post) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newPost = await _apiService.createPost(post);
      _posts.insert(0, newPost);

      await _savePostsToLocal(_posts);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
