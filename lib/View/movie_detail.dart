import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_application/Services/movie_api_service.dart';

class MovieDetail extends StatefulWidget {
  final int id;
  final String image, title, overview, releaseDate, rating;

  const MovieDetail({
    super.key,
    required this.image,
    required this.title,
    required this.overview,
    required this.rating,
    required this.releaseDate,
    required this.id,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final MovieApiService _movieApiService = MovieApiService();
  final TextEditingController ratingC = TextEditingController();
  double _currentRating = 5.0;

  void submitRating() {
    _movieApiService.postMovieRating(movieId: widget.id, rating: _currentRating);
    ScaffoldMessenger.of(context).showSnackBar(
   const  SnackBar(
        content: Text('Rating Posted!'),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), 
      appBar: AppBar(
        backgroundColor:const Color(0xFF1E1E1E),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.title,
          style:const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              GestureDetector(
                onTap: () {
                   
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                         offset:const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.image,
                          height: 350.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                   
                    Container(
                      height: 300.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orangeAccent, size: 18.sp),
                              SizedBox(width: 4.h),
                              Text(
                                widget.rating,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

               
              Text(
                "Overview",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.overview,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 16.h),

               
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                     const   Icon(Icons.date_range, color: Colors.lightBlueAccent),
                        SizedBox(width: 5.w),
                        Text(
                          widget.releaseDate,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                       const Icon(Icons.star, color: Colors.orangeAccent),
                        SizedBox(width: 5.w),
                        Text(
                          widget.rating,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Center(
                child: Column(
                  children: [
                    Text(
                      "Rate this Movie",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  const SizedBox(height: 12),
                    Slider(
                      value: _currentRating,
                      min: 0.5,
                      max: 10.0,
                      divisions: 19,
                      label: _currentRating.toString(),
                      activeColor: Colors.tealAccent,
                      inactiveColor: Colors.white24,
                      onChanged: (value) {
                        setState(() {
                          _currentRating = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: submitRating,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                      ),
                      child:const Text(
                        "Submit Rating",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
