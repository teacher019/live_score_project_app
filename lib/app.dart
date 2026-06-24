import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_score_project_app/screens/add_match_screen.dart';
import 'package:live_score_project_app/screens/home_screen.dart';
import 'package:live_score_project_app/screens/sign_in_screen.dart';
import 'package:live_score_project_app/screens/sign_up_screen.dart';
import 'package:live_score_project_app/utils/analytics_route_observer.dart';
import 'package:live_score_project_app/utils/crashlytics_route_observer.dart';

class LiveScoreApp extends StatelessWidget {
  const LiveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score App',
      debugShowCheckedModeBanner: false,

      navigatorObservers: [
        CrashlyticsRouteObserver(),
        AnalyticsRouteObserver(),
      ],

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          }

          return const SignInScreen();
        },
      ),

      routes: {
        '/home': (_) => const HomeScreen(),
        '/sign-in': (_) => const SignInScreen(),
        '/sign-up': (_) => const SignUpScreen(),
        '/add-match': (_) => const AddMatchScreen(),
      },
    );
  }
}