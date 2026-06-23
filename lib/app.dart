import 'package:flutter/material.dart';
import 'package:live_score_project_app/screens/home_screen.dart';
class LiveScoreProjectApp extends StatelessWidget {
  const LiveScoreProjectApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}