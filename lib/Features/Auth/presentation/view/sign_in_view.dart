import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignIn/sign_in_cubit.dart';
import 'package:speedo_life/Features/Auth/presentation/view/widgets/sign_in_view_body.dart';
import 'package:speedo_life/injection_container.dart' as di;

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SignInCubit>(),
      child: const SignInViewBody(),
    );
  }
}
