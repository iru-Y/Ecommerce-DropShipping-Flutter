import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/auth_cubit_cubit.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/pages/home/home_view.dart';
import 'package:trizi/view/pages/login/login_view.dart';
import 'package:trizi/view/pages/presentation/apresentation_view.dart';
import 'package:trizi/view/pages/register/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(), // Create your UserCubit instance
        ),
        // Add more BlocProviders if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Dmsans-black'),
        routes: {
          AppRoute.PRESENTATION: (context) => const AprensentationView(),
          AppRoute.HOME: (context) => const HomeView(),
          AppRoute.LOGIN: (context) => const LoginView(),
          AppRoute.REGISTER: (context) => const RegisterView()
        },
      ),
    );
  }
}
