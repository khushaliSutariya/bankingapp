import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Homepage.dart';
import 'loginpage.dart';
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  void resetNewLaunch() async {
    Timer(Duration(seconds: 1), () async {
      if (!mounted) return;
      SharedPreferences _prefs =
      await SharedPreferences.getInstance();
      bool? isLoggedIn = _prefs.getBool("loggedIn");

      if (isLoggedIn != null && isLoggedIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  Homepage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  loginpage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    resetNewLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SplashScreen"),
          ],
        ),
      ),
    );
  }
}
