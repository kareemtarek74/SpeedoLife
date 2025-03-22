import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:speedo_life/Features/Auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:speedo_life/injection_container.dart' as di;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = "signup";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => di.sl<SignUpCubit>(),
      child: const SignUpViewBody(),
    );
  }
}
