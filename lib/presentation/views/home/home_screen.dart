import 'package:bloc_clean_architecture/core/utils/exceptions/theme_exception.dart';
import 'package:bloc_clean_architecture/core/utils/local_storage/local_storage.dart';
import 'package:bloc_clean_architecture/domain/usecases/get_movies_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/colors/app_color.dart';
import '../../../config/components/loader_widget.dart';
import '../../../l10n/app_localizations.dart';
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
    final localization = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) =>
          MoviesBloc(getMoviesUseCase: getIt<GetMoviesUseCase>())
            ..add(FetchMovies()),

      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 4.0,
          surfaceTintColor: context.theme.scaffoldBackgroundColor,
          backgroundColor: context.theme.scaffoldBackgroundColor,
          title: Text(
            localization.movies,
            style: context.theme.textTheme.titleMedium!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColor.blue,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => showLogoutBottomSheet(context, localization),
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
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final tvShows = state.movies[index];

                        return Card(
                          color: context.theme.cardColor,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    tvShows.imageThumbnail ?? '',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 6,
                                ),
                                child: Text(
                                  tvShows.name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.theme.textTheme.titleMedium!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
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

  Future<bool?> showLogoutBottomSheet(
    BuildContext context,
    AppLocalizations localization,
  ) {
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

              Text(
                localization.logoutText,
                style: context.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),

                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              /// NO button
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
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
                        child: Text(
                          localization.no,
                          style: context.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  /// YES button
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
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
                          localization.yes,
                          style: context.theme.textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: AppColor.white,
                          ),
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
