import 'dart:convert';
import 'package:movies_application/Modals/top_rated_movies_model.dart';
import 'package:movies_application/Modals/trending_movies_model.dart';
import 'package:http/http.dart' as http;
import 'package:movies_application/Modals/upcoming_movies_model.dart';

class MovieApiService { 
  final String base_URL='https://api.themoviedb.org/3';
  final String apiKey='0beae88f8e17c6b66e56a5d20641c786';
  
  Future<TrendingMoviesModel>getTrendingMovies()async{
    final String URL='$base_URL/trending/movie/week?api_key=$apiKey';
    final response=await http.get(Uri.parse(URL));
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      return TrendingMoviesModel.fromJson(data);
    }else{
      throw Exception('Failed to load data');
    }
  }

  Future<TopRatedMoviesModel>getTopRatedMovies()async{
    final String URL='$base_URL/movie/top_rated?api_key=$apiKey';
    final respnse=await http.get(Uri.parse(URL));
    if(respnse.statusCode==200){ 
      final data=jsonDecode(respnse.body);
      return TopRatedMoviesModel.fromJson(data);
    }else{
      throw Exception('Failed to load data');
    }
  }

  Future<UpcomingMoviesModel>getUpcomingMovies()async{
    final String URL='$base_URL/movie/upcoming?api_key=$apiKey';
    final response=await http.get(Uri.parse(URL));
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      return UpcomingMoviesModel.fromJson(data);
    }else{
      throw Exception('Failed to load data');
    }
  }

 
  // API base URL and endpoint for posting a rating
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '0beae88f8e17c6b66e56a5d20641c786'; 
  final String _bearerToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYmVhZTg4ZjhlMTdjNmI2NmU1NmE1ZDIwNjQxYzc4NiIsIm5iZiI6MTczMTQ1MDQxOS4zOTcxMDkzLCJzdWIiOiI2NzJmMzQxYWE3MWFlYTdjYWZmOWI4ZTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.6wAxLfqhzSfnhAXiIP2AmoM0JFjVogTI_id2DHwkcdM';

  // Function to post a movie rating
  Future<void> postMovieRating({
    required int movieId,
    required double rating,
 
  }) async {
    final url = '$_baseUrl/movie/$movieId/rating?api_key=$_apiKey';

    // Header to include the bearer token for authorization
    final headers = {
      'Content-Type': 'application/json;charset=utf-8',
      'Authorization': 'Bearer $_bearerToken',
    };

    // Body with the rating (must be between 0.5 and 10.0)
    final body = jsonEncode({
      'value': rating,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 201) {
        print('Rating submitted successfully!');
      } else {
        print('Failed to submit rating. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error posting rating: $error');
    }
  }
}

