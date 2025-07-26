import 'package:flutter/material.dart';
import 'package:flutter_gsmpay_interview/features/home/presentation/page/home_page.dart';
import 'package:flutter_gsmpay_interview/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterGsmpayInterview extends StatelessWidget {
  const FlutterGsmpayInterview({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
    );
  }
}
