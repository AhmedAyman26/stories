import 'package:flutter/material.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_model.dart';
import 'package:stories_viewer_app/fratures/stories/domain/entities/story_test_data.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/add_story_page.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/stories_page.dart';
import 'package:stories_viewer_app/fratures/stories/ui/pages/view_story_page/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  StoriesScreen(),
    );
  }
}

