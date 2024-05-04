import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toatlx_machine_test/view/auth/controller/authcontroller.dart';
import 'package:toatlx_machine_test/view/homescreen/controller/homecontroller.dart';
import 'package:toatlx_machine_test/view/splashscreen/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HomeController()),
      ChangeNotifierProvider(create: (_) => AuthController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Totalx Machine Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light,
        home: SplashScreen());
  }
}
