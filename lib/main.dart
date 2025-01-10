
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  
  runApp(const MyApp());
 
  OneSignal.initialize('0a35afa9-5361-43e2-9149-df923ce38aee');
  
  OneSignal.Notifications.requestPermission(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
     String getRoute(){
      bool isOnboardingViewed=CacheHelper.getData( key: kIsOnboardingViewKey,) ??false;
    var isLoggedIn = FirebaseAuthService().isLoggedIn();
    //var isLoggedInn=CacheHelper.getData( key: kSaveUserDataKey,) !=null ? true : false;
    if(isLoggedIn && isOnboardingViewed){
      return Routes.mainView;
    }else if(!isLoggedIn && isOnboardingViewed){
      return Routes.loginView;
    }else{
      return Routes.onBoardingView;
    }}
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
        initialRoute:getRoute(),
      ),
    );
  }
}