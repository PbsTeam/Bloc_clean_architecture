import '../entities/movies/movie_entity.dart';
import '../entities/movies/movies_list_entity.dart';

abstract class MoviesRepository {
  Future<MovieListEntity> getMovies({int page = 1});
}
