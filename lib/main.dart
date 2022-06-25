import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_recipe_app/app/app.router.dart';

import 'app/app.locator.dart';

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  setupLocator();
  final dio = Dio();
  (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  runApp(
    GetMaterialApp(
      navigatorKey: Get.key,
      title: 'My CookBook App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.SplashView,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
