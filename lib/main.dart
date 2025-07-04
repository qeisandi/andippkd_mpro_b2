import 'package:andippkd_mpro_b2/meet_lima_belas/dashboard.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/login.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/profile.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/register.dart';
import 'package:andippkd_mpro_b2/meet_sebelas/login_screen.dart';
import 'package:andippkd_mpro_b2/meet_sebelas/register_screen.dart';
import 'package:andippkd_mpro_b2/splash_screen/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/Splash': (context) => Splash(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ProfileLimaBelas.id: (context) => ProfileLimaBelas(),
        HomeScreen.id: (context) => HomeScreen(),
        '/register': (context) => RegisLimaBelas(), // halaman register kamu
        '/signin': (context) => SignInPage(), // halaman login ini
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      // home: const SplashScreen(),
    );
  }
}
