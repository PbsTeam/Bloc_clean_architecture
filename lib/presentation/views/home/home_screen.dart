import 'package:bloc_clean_architecture/core/utils/local_storage/local_storage.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_movies_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/colors/app_color.dart';
import '../../../config/components/loader_widget.dart';
import '../../../service_locator.dart';
import '../../viewmodel/movies_viewmodel/movies_bloc.dart';
import '../../viewmodel/movies_viewmodel/movies_event.dart';
import '../../viewmodel/movies_viewmodel/movies_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc(getMoviesUseCase: getIt<GetMoviesUseCase>())
            ..add(FetchMovies()),

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 4.0,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            'Movie\'s',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.blue,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => showLogoutBottomSheet(context),
              icon: Icon(Icons.logout, color: AppColor.blue),
            ),
          ],
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            _scrollController.addListener(() {
              final bloc = context.read<MoviesBloc>();

              final position = _scrollController.position;

              if (position.pixels >= position.maxScrollExtent - 200) {
                bloc.add(LoadMoreMovies());
              }
            });

            if (state.isLoading) {
              return Center(child: Loader());
            }

            if (state.error != null && state.movies.isEmpty) {
              return Center(child: Text(state.error ?? ''));
            }

            if (state.isLoading == false && state.movies.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: EdgeInsets.only(bottom: 20),
                      itemCount: state.movies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        var tvShows = state.movies[index];

                        if (index == state.movies.length) {
                          return state.isMoreLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const SizedBox();
                        }
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          elevation: 4.0,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(60 / 2),
                              child: Image.network(
                                tvShows.imageThumbnail ?? '',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              tvShows.name ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  if (state.isMoreLoading) ...[
                    const SizedBox(height: 15),
                    Center(child: Loader()),
                    const SizedBox(height: 15),
                  ],
                ],
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }

  Future<bool?> showLogoutBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),

              const Text(
                "Are you sure you want to Logout?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              /// NO button
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColor.blue, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text(
                          "NO",
                          style: TextStyle(fontSize: 16, color: AppColor.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  /// YES button
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          LocalStorage.instance.clearAll(context);
                        },
                        child: Text(
                          "YES",
                          style: TextStyle(fontSize: 16, color: AppColor.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
