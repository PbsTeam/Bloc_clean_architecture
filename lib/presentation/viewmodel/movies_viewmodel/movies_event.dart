import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovies extends MoviesEvent {}

class LogoutEvent extends MoviesEvent {}
class LoadMoreMovies extends MoviesEvent {}
