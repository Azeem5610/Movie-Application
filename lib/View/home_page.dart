import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/Services/movie_api_service.dart';
import 'package:movies_application/Widgets/movies_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final MovieApiService _movieApiService = MovieApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const  LinearGradient(
              colors: [Colors.purple, Colors.blue, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Text(
            'FilmFlare', 
            style: TextStyle(
              fontSize: 32.sp, 
              fontWeight: FontWeight.bold, 
              color: Colors.white, 
              shadows: [
                Shadow(
                  blurRadius: 10.r,  
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2, 2), 
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieCategoryWidget("Trending Movies", _movieApiService.getTrendingMovies(), context),
            MovieCategoryWidget("Top-rated Movies",  _movieApiService.getTopRatedMovies(), context),
            MovieCategoryWidget("Upcoming Movies",  _movieApiService.getUpcomingMovies(), context),
          ],
        ),
      ),
    );
  }
}
