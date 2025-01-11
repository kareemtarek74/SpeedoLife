import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/app.dart';
import 'package:speedo_life/bloc_observer.dart';
import 'package:speedo_life/core/prefs/my_shared_prefs.dart';
import 'package:speedo_life/core/utils/config_loading.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initSharePre();

  await di.init();
  //Stripe.publishableKey=EndPoints.publishableKey;
  Bloc.observer = AppBlocObserver();
  ConfigLoading.configLoading();
  runApp(const SpeedoLifeApp());
}
