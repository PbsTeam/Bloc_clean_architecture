import '../entities/movies/movie_entity.dart';
import '../entities/movies/movies_list_entity.dart';
import '../repositories/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository repository;

  GetMoviesUseCase(this.repository);

  Future<MovieListEntity> call({int page = 1}) async {
    return await repository.getMovies(page: page);
  }
}
