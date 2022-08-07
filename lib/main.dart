import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project1/core/store.dart';
import 'package:project1/home.dart';
import 'package:project1/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/pages/cart_page.dart';
import 'package:project1/utilities/routes.dart';
import 'package:project1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(VxState(store: MyStore(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
