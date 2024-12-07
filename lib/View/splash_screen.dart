import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/View/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () =>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),))
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Stack(
        fit: StackFit.expand,  
        children: [
        
          Image.asset(
            'images/splashscreen.png',
            fit: BoxFit.cover,  
          ),
        
          Positioned(
            top: 50.h, 
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
  
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.cyan],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: Text(
                      'FilmFlare', 
                      style: TextStyle(
                        fontSize: 60, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white, 
                        shadows: [
                          Shadow(
                            blurRadius: 15.r,
                            color: Colors.black.withOpacity(0.7),
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
