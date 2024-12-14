import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:speedo_life/Features/Home/presentation/views/main_view.dart';
import 'package:speedo_life/core/helper_function/on_generate_function.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const SpeedoLifeApp());
}

class SpeedoLifeApp extends StatelessWidget {
  const SpeedoLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      supportedLocales: [
        Locale('ar'),
      ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: MainView.routeName,
    );
  }
}
