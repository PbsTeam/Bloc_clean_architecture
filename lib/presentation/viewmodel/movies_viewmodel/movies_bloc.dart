import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/local_storage/local_storage.dart';
import '../../../domain/usecases/get_movies_usecases.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;
  MoviesBloc({required this.getMoviesUseCase}) : super(const MoviesState()) {
    on<FetchMovies>(_onFetchMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
  }
  bool isRequesting = false;

  Future<void> _onFetchMovies(
    FetchMovies event,
    Emitter<MoviesState> emit,
  ) async
  {
    // If no more data → do nothing
    if (!state.hasMore) return;

    // First page → show main loader
    if (state.page == 1) {
      emit(state.copyWith(isLoading: true));
    } else {
      // Pagination loader
      emit(state.copyWith(isMoreLoading: true));
    }

    try {
      final movieResponse = await getMoviesUseCase(page: state.page);

      final newMovies = [...state.movies, ...movieResponse.results];

      emit(
        state.copyWith(
          movies: newMovies,
          isLoading: false,
          isMoreLoading: false,
          page: state.page,
          hasMore: movieResponse.results.isNotEmpty,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isMoreLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<MoviesState> emit,
  ) async
  {
    if (isRequesting || state.isMoreLoading || !state.hasMore) return;

    isRequesting = true;

    emit(state.copyWith(isMoreLoading: true));

    final nextPage = state.page + 1;

    try {
      final response = await getMoviesUseCase(page: nextPage);

      emit(
        state.copyWith(
          movies: [...state.movies, ...response.results],
          page: nextPage,
          hasMore: nextPage <= response.totalPages,
          isMoreLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isMoreLoading: false));
    }

    isRequesting = false;
  }

}
