import 'dart:io';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/http_override.dart';
import 'package:projectmanagers/binding/binding.dart';
import 'package:projectmanagers/language/translations.dart';
import 'package:projectmanagers/router/custom_router.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  Get.put(CheckInterNet());
  Get.put(CheckInterNet());
  await GetStorage.init();

   HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // اللون الخلفي لشريط الحالة
    statusBarIconBrightness: Brightness.dark, // لون الأيقونات (فاتح أو داكن)
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp>{
  GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) => GetMaterialApp(
            navigatorKey: mainNavigatorKey,
            debugShowCheckedModeBanner: false,
            initialBinding: InternetBinding(),
            translations: Translation(),
            locale: Locale(stg.read(language) ?? 'ar'),
            fallbackLocale: Get.deviceLocale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales:const [
              Locale('en', 'US'), // English, no country code
              Locale('ar', ''), // Arabic, no country code
            ],
            theme:themeData,
            title:"EASY DOCS",
            getPages: Pages.pages(),
            defaultTransition: Transition.rightToLeftWithFade,
            transitionDuration:const  Duration(milliseconds: 400),
            initialRoute: RoutingApp.splashRoute
        )
    );
  }
}
