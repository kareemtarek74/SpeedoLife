import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:speedo_life/Features/Auth/presentation/view/sign_in_view.dart';
import 'package:speedo_life/Features/Main/presentation/cubits/buttom_navigation_cubit.dart';
import 'package:speedo_life/core/Network/connection_cubit.dart';
import 'package:speedo_life/core/helper_function/on_generate_function.dart';
import 'package:speedo_life/core/widgets/disconnected_screen.dart';
import 'package:speedo_life/generated/l10n.dart';
import 'package:speedo_life/injection_container.dart' as di;

class SpeedoLifeApp extends StatefulWidget {
  const SpeedoLifeApp({super.key});

  @override
  State<SpeedoLifeApp> createState() => _SpeedoLifeAppState();
}

class _SpeedoLifeAppState extends State<SpeedoLifeApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ConnectionCubit>(
            create: (context) => di.sl<ConnectionCubit>(),
          ),
          BlocProvider<BottomNavigationCubit>(
            create: (context) => di.sl<BottomNavigationCubit>(),
          ),
        ],
        child: BlocBuilder<ConnectionCubit, ConnectionStatus>(
          builder: (context, state) {
            if (state == ConnectionStatus.disconnected) {
              return const MaterialApp(
                home: DisconnectedScreen(),
                debugShowCheckedModeBanner: false,
              );
            } else {
              return MaterialApp(
                navigatorKey: navigatorKey,
                supportedLocales: const [
                  Locale('ar'),
                ],
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: const Locale('ar'),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: onGenerateRoute,
                initialRoute: SignInView.routeName,
              );
            }
          },
        ),
      ),
    );
  }
}
