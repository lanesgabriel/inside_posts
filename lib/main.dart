import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/post_provider.dart';
import 'screens/home_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blueGrey.shade400,
  brightness: Brightness.light,
);

final theme = ThemeData().copyWith(
  scaffoldBackgroundColor: colorScheme.surface,
  colorScheme: colorScheme,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()..fetchPosts()),
      ],
      child: MaterialApp(
        title: 'Daily Posts',
        theme: theme,
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
