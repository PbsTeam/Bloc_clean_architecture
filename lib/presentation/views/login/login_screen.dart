import 'dart:developer';
import 'package:bloc_clean_architecture/core/utils/exceptions/theme_exception.dart';
import 'package:bloc_clean_architecture/domain/usecases/login_usecases.dart';
import 'package:bloc_clean_architecture/presentation/viewmodel/theme_viewmodel/theme_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/colors/app_color.dart';
import '../../../config/components/app_snack_bar.dart';
import '../../../config/components/app_textform_field.dart';
import '../../../config/components/custom_button.dart';
import '../../../config/components/loader_widget.dart';
import '../../../config/routes/routes_names.dart';
import '../../../core/constants/image_constants.dart';
import '../../../core/constants/string_constants.dart';
import '../../../core/utils/enums/enums.dart';
import '../../../core/utils/validations/validations.dart';
import '../../../l10n/app_localizations.dart';
import '../../../service_locator.dart';
import '../../viewmodel/auth_viewmodel/login_bloc.dart';
import '../../viewmodel/auth_viewmodel/login_state.dart';
import '../../viewmodel/localization_viewmodel/localization_bloc.dart';
import '../../viewmodel/localization_viewmodel/localization_event.dart';
import '../../viewmodel/localization_viewmodel/localization_state.dart';
import '../../viewmodel/theme_viewmodel/theme_bloc.dart';
import '../../viewmodel/theme_viewmodel/theme_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => LoginBloc(loginUseCase: getIt<LoginUseCase>()),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: context.read<LoginBloc>().formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            ImageConstants.possibilityLogo,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),

                          SizedBox(height: 25),
                          Text(
                            localization.welcomeBack,
                            style: context.theme.textTheme.titleMedium!
                                .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                localization.loginHere,
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.blue,
                                    ),
                              ),
                              const SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: AppColor.blue),
                            ],
                          ),

                          SizedBox(height: 40),

                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return AppTextFormField(
                                hintText: localization.pleaseEnterEmail,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: AppColor.blue,
                                ),
                                onChanged: (email) {
                                  context.read<LoginBloc>().add(
                                    EmailEvent(email: email),
                                  );

                                  context.read<LoginBloc>().debouncer.run(() {
                                    context
                                        .read<LoginBloc>()
                                        .formKey
                                        .currentState!
                                        .validate();
                                  });
                                },
                                validator: (email) {
                                  if ((email ?? '').isEmpty) {
                                    return localization.pleaseEnterEmail;
                                  } else if (!Validations.isValidEmail(
                                    email ?? '',
                                  )) {
                                    return localization.pleaseEnterAValidEmail;
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              return AppTextFormField(
                                hintText: localization.pleaseEnterPassword,
                                prefixIcon: Icon(
                                  Icons.lock_rounded,
                                  color: AppColor.blue,
                                ),
                                onChanged: (password) {
                                  context.read<LoginBloc>().add(
                                    PasswordEvent(password: password),
                                  );

                                  context.read<LoginBloc>().debouncer.run(() {
                                    context
                                        .read<LoginBloc>()
                                        .formKey
                                        .currentState!
                                        .validate();
                                  });
                                },
                                validator: (pass) {
                                  if ((pass ?? '').isEmpty) {
                                    return localization.pleaseEnterPassword;
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          SizedBox(height: 40),
                          Builder(
                            builder: (context) {
                              return BlocListener<LoginBloc, LoginState>(
                                listenWhen: (previous, current) =>
                                    (current is LoginFormState &&
                                        previous is LoginFormState) &&
                                    current.apiStatus != previous.apiStatus,
                                listener: (context, state) {
                                  if (state is LoginFormState) {
                                    if (state.apiStatus ==
                                            PostApiStatus.error &&
                                        (state.error ?? '').isNotEmpty) {
                                      AppSnackBar.show(
                                        context: context,
                                        error: state.error ?? "",
                                      );
                                    } else if (state.apiStatus ==
                                        PostApiStatus.sucess) {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RoutesName.homeScreen,
                                        (route) => false,
                                      );
                                    }
                                  }
                                },
                                child:
                                    context
                                            .watch<LoginBloc>()
                                            .state
                                            .apiStatus ==
                                        PostApiStatus.loading
                                    ? Center(child: Loader())
                                    : CustomButton(
                                        title: localization.login,
                                        onTap: () {
                                          var loginBloc = context
                                              .read<LoginBloc>();

                                          if (loginBloc.formKey.currentState!
                                              .validate()) {
                                            loginBloc.add(SubmitButtonEvent());
                                          }
                                        },
                                      ),
                              );
                            },
                          ),
                          const SizedBox(height: 30),

                          /// Change Language
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                localization.changeLanguage,
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              BlocBuilder<LocalizationBloc, LocalizationState>(
                                builder: (context, state) {
                                  return OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: AppColor.blue),
                                    ),
                                    onPressed: () => showLanguageBottomSheet(
                                      context,
                                      localization,
                                    ),
                                    child: Text(
                                      state.locale.languageCode == 'en'
                                          ? StringConstants.english
                                          : StringConstants.hindi,
                                      style: TextStyle(color: AppColor.blue),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          /// Change Theme
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                localization.changeTheme,
                                style: context.theme.textTheme.titleMedium!
                                    .copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return CupertinoSwitch(
                                    value:
                                        context
                                            .read<LoginBloc>()
                                            .themeVM
                                            .currentTheme ==
                                        ThemeMode.dark,
                                    activeTrackColor: AppColor.blue,
                                    onChanged: (value) {
                                      context
                                          .read<LoginBloc>()
                                          .themeVM
                                          .toggleTheme();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showLanguageBottomSheet(
    BuildContext context,
    AppLocalizations localization,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final localizationBloc = context.read<LocalizationBloc>();
        final currentLocale = localizationBloc.state.locale;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                localization.changeLanguage,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text("English"),
                trailing: currentLocale.languageCode == 'en'
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  localizationBloc.add(ChangeLanguageEvent(const Locale('en')));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("हिंदी"),
                trailing: currentLocale.languageCode == 'hi'
                    ? const Icon(Icons.check, color: Colors.blue)
                    : null,
                onTap: () {
                  localizationBloc.add(ChangeLanguageEvent(const Locale('hi')));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
