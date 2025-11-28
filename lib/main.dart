import 'package:bloc_clean_architecture/core/utils/local_storage/local_storage.dart';
import 'package:bloc_clean_architecture/presentation/viewmodel/localization_viewmodel/localization_bloc.dart';
import 'package:bloc_clean_architecture/presentation/viewmodel/localization_viewmodel/localization_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';
import 'l10n/app_localizations.dart';
import 'service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:  HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
  );
  serviceLocator();
  await LocalStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          create: (_) => getIt<LocalizationBloc>(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        bloc: getIt<LocalizationBloc>(),
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
            child: MaterialApp(
              title: 'Bloc With Clean Architecture With MVVM',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              initialRoute: RoutesName.splashScreen,
              onGenerateRoute: Routes.generateRoute,
            ),
          );
        },
      ),
    );
  }
}
