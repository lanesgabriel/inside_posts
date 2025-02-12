import 'package:flutter/material.dart';
import 'package:inside_posts/screens/create_post_screen.dart';
import 'package:inside_posts/screens/post_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showAddTaskModal() {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: CreatePostScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Posts'),
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          post.title,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          post.body,
                          textAlign: TextAlign.justify,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PostDetailScreen(post: post),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskModal();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
