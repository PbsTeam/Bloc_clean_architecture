import 'package:equatable/equatable.dart';

import '../../../domain/entities/movies/movie_entity.dart';

class MoviesState extends Equatable {
  final List<MovieEntity> movies;
  final bool isLoading;
  final bool isMoreLoading;
  final int page;
  final bool hasMore;
  final String? error;

  const MoviesState({
    this.movies = const [],
    this.isLoading = false,
    this.isMoreLoading = false,
    this.page = 1,
    this.hasMore = true,
    this.error,
  });

  MoviesState copyWith({
    List<MovieEntity>? movies,
    bool? isLoading,
    bool? isMoreLoading,
    int? page,
    bool? hasMore,
    String? error,
  }) {
    return MoviesState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
      isMoreLoading: isMoreLoading ?? this.isMoreLoading,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      error: error,
    );
  }

  @override
  List<Object?> get props => [movies, isLoading, isMoreLoading, page, hasMore, error];
}