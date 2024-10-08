import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gac/core/helper_functions/on_generate_routes.dart';
import 'package:gac/core/helper_functions/rouutes.dart';
import 'package:gac/core/services/get_it_service.dart';
import 'package:gac/core/utils/app_colors.dart';
import 'package:gac/core/utils/bloc_observer.dart';
import 'package:gac/firebase_options.dart';
import 'package:gac/generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360, 800),
       minTextAdapt: true,
      child: MaterialApp(
        title: 'الشركة العربية الخليجية',
        theme: ThemeData(
          fontFamily:'Cairo',
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
        initialRoute: Routes.onBoardingView,
      ),
    );
  }
}

