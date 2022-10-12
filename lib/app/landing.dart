import 'package:flutter/material.dart';
import 'package:overcover/app/router.dart';
import 'package:overcover/src/screens/home/home_screen.dart';

class AppLanding extends StatelessWidget {
  const AppLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {    

    return MaterialApp(
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}