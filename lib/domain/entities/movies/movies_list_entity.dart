import 'movie_entity.dart';

class MovieListEntity {
  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MovieListEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
