import 'dart:developer';

import '../../../core/api/network_service.dart';
import '../../../core/constants/api_constants.dart';
import '../../../service_locator.dart';
import '../../models/movie_modal/movie_modal.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieModal> getMovies({int page = 1});
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final _networkServices = getIt.get<NetworkApiService>();

  @override
  Future<MovieModal> getMovies({int page = 1}) async {
    final response = await _networkServices.getApiService(
      url: '${ApiConstants.getMovies}?page=$page',
    );

    log('response=>$response');
    return MovieModal.fromJson(response);
  }
}
