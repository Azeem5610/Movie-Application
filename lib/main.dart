import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/View/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( 
      designSize: const Size(360,780),
      builder: (context, child) {
      return MaterialApp(
    theme: ThemeData( 
     brightness: Brightness.dark,
     primaryColor: Colors.black, 
     scaffoldBackgroundColor: Color(0xFF1E1E1E),
     appBarTheme:const AppBarTheme(
     backgroundColor:Color(0xFF1E1E1E),
     centerTitle: true,
   
  ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
      },
    );
  }
}
