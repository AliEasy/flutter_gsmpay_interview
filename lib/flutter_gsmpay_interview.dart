import 'package:flutter/material.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/page/home_page.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterGsmpayInterview extends StatelessWidget {
  const FlutterGsmpayInterview({super.key});

  @override
  Widget build(BuildContext context) {
    String fontFamily = 'Dana';

    return MaterialApp(
      title: 'GsmPay Interview',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeData.light().colorScheme.primary,
            foregroundColor: ThemeData.light().colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            fontFamily: fontFamily,
          ),
          displayMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            fontFamily: fontFamily,
          ),
          displaySmall: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily,
          ),
          headlineLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: fontFamily,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            fontFamily: fontFamily,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            fontFamily: fontFamily,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w100,
            fontFamily: fontFamily,
          ),
        ),
      ),
    );
  }
}
