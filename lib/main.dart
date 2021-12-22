import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiren_app/views/login/login_view.dart';

void main() {
  runApp(const GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          hintColor: const Color(0xffDEC5FF),
          colorScheme: const ColorScheme(
            primary: Color(0xffffffff),
            primaryVariant: Color(0xff8AE2A3),
            secondary: Color(0xffB986EF),
            secondaryVariant: Color(0xffCEB9EA),
            surface: Color(0xffF97A7A),
            background: Color(0xffD3EDD9),
            error: Color(0xffF97A7A),
            onPrimary: Color(0xffCEB9EA),
            onSecondary: Color(0xffffffff),
            onSurface: Color(0xffffffff),
            onBackground: Color(0xff686868),
            onError: Color(0xffffffff),
            brightness: Brightness.light,
          )),
      home: const LoginView(),
    );
  }
}
