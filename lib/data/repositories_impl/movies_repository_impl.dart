import '../../core/api/network_service.dart';
import '../../core/constants/api_constants.dart';
import '../../domain/entities/movies/movie_entity.dart';
import '../../domain/entities/movies/movies_list_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../../service_locator.dart';
import '../datasources/remote/movies_remote_datasource.dart';
import '../models/movie_modal/movie_modal.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final remote = getIt.get<MoviesRemoteDataSource>();

  @override
  Future<MovieListEntity> getMovies({int page = 1}) async {
    final response = await remote.getMovies(page: page);
    return MovieListEntity(
      page: response.page ?? 0,
      totalPages: response.total ?? 0,
      totalResults: response.total ?? 0,
      results: (response.tvShows ?? [])
          .map(
            (movie) => MovieEntity(
              id: movie.id,
              status: movie.status,
              country: movie.country,
              endDate: movie.endDate,
              startDate: movie.startDate,
              name: movie.name,
              network: movie.network,
              permalink: movie.permalink,
              imageThumbnail: movie.imageThumbnail,
            ),
          )
          .toList(),
    );
  }
}
