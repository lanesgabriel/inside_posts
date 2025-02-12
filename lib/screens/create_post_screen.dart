import 'package:flutter/material.dart';
import 'package:inside_posts/models/post.dart';
import 'package:provider/provider.dart';
import '../providers/post_provider.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _savePost() {
    final enteredTitle = _titleController.text.trim();
    final enteredBody = _bodyController.text.trim();

    if (enteredTitle.isEmpty || enteredBody.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Dados inválidos'),
          content: const Text(
              'Por favor certifique-se que o título e a descrição são válidos.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }

    final postProvider = Provider.of<PostProvider>(
      context,
      listen: false,
    );
    postProvider.addPost(
      Post(
        id: 0,
        title: enteredTitle,
        body: enteredBody,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                key: Key('titleField'),
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'O que você está pensando?',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.mode_comment, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira um título válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: Key('bodyField'),
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Adicione uma nota...',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.edit, color: Colors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira uma descrição válida';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _savePost,
                child: Text(
                  'Create Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
