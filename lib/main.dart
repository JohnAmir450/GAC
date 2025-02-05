
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/cache_helper.dart';
import 'package:gac/core/helper_functions/on_generate_routes.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/firebase_auth_service.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/bloc_observer.dart';
import 'package:gac/core/utils/chache_helper_keys.dart';
import 'package:gac/firebase_options.dart';
import 'package:gac/generated/l10n.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  setupGetIt();

  OneSignal.initialize('0a35afa9-5361-43e2-9149-df923ce38aee');
  await OneSignal.Notifications.requestPermission(true); // ✅ Ensure it's ready

  runApp(const MyApp()); // ✅ Runs after all initializations
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String getRoute() {
      final bool isOnboardingViewed = CacheHelper.getData(key: kIsOnboardingViewKey) ?? false;
      final bool isLoggedIn = FirebaseAuthService().isLoggedIn();

      if (!isOnboardingViewed) return Routes.onBoardingView;
      return isLoggedIn ? Routes.mainView : Routes.loginView;
    }

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: false,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1), 
                ),
                child: child!,
              );
            },
            title: 'الشركة العربية الخليجية',
            theme: ThemeData(
              fontFamily: 'Cairo',
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: getRoute(),
          );
        },
      ),
    );
  }
}
