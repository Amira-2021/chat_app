import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/account/create_account.dart';
import 'package:chatapp/screens/home/home_screen.dart';
import 'package:chatapp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeNamed,
      routes:{
        SplashScreen.routeNamed:(_)=>SplashScreen(),
        AccountScreen.routeNamed:(_)=>AccountScreen(),
        HomeScreen.routeNamed:(_)=>HomeScreen(),
      },
    );
  }
}
