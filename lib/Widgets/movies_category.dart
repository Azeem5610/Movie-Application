import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_application/View/movie_detail.dart';

Widget MovieCategoryWidget(
  String title,
  Future future,
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 230.h,
        child: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                final format=DateFormat('dd MM yyyy');
                  String posterPath = snapshot.data.results[index].posterPath;
                  String posterUrl = 'https://image.tmdb.org/t/p/w500$posterPath';
                  String overview = snapshot.data.results[index].overview;
                  String movieName = snapshot.data.results[index].title;
                  int id=snapshot.data.results[index].id;
              //    String releaseDate = snapshot.data.results[index].releaseDate.toString();
                  DateTime date=DateTime.parse(snapshot.data.results[index].releaseDate.toString());
                  
                  String rating=double.parse(snapshot.data.results[index].voteAverage.toString()).toStringAsFixed(1) ; 
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(
                              image: posterUrl,
                              title: movieName,
                              overview: overview,
                              releaseDate:format.format(date),
                              rating:rating,
                              id:id
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[900], // Slightly lighter background
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(2, 4),
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3), // Add subtle border
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              Image.network(
                                posterUrl,
                                width: 160.w,
                                height: 200.h,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.2),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      movieName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    ],
  );
}
