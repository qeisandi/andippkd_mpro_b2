import 'package:andippkd_mpro_b2/helper/preference.dart';
import 'package:andippkd_mpro_b2/splash_screen/splash.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await PreferenceHandler.getLogin();
      print("isLogin: $isLogin");
      if (isLogin) {
        return Navigator.pushNamedAndRemoveUntil(
          context,
          Splash.id,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/Splash", (route) => false);
      }
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            // Image.asset(AppImage.pisang),
            SizedBox(height: 20),
            Text(
              "Flutter Apps",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Spacer(),
            SafeArea(child: Text("v 1.0.0", style: TextStyle(fontSize: 10))),
          ],
        ),
      ),
    );
  }
}
