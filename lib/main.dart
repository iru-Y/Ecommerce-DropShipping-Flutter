import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trizi/domain/cubit/auth_cubit_cubit.dart';
import 'package:trizi/domain/cubit/product_cubit.dart';
import 'package:trizi/domain/cubit/user_cubit.dart';
import 'package:trizi/utils/http_router.dart';
import 'package:trizi/utils/routes.dart';
import 'package:trizi/view/desktop/presentation/presentation_view.dart';
import 'package:trizi/view/mobile/pages/home/home_view.dart';
import 'package:trizi/view/mobile/pages/login/login_view.dart';
import 'package:trizi/view/mobile/pages/presentation/apresentation_view.dart';
import 'package:trizi/view/mobile/pages/register/register_view.dart';

  main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => ProductCubit())
      ],
      child: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop();
            return true;
          },
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Dmsans-black'),
              routes: Platform.isAndroid || Platform.isIOS
                  ? {
                      AppRoute.MOBILE_PRESENTATION: (context) =>
                          const MobileAprensentationView(),
                      AppRoute.MOBILE_HOME: (context) => const MobileHomeView(),
                      AppRoute.MOBILE_LOGIN: (context) =>
                          const MobileLoginView(),
                      AppRoute.MOBILE_REGISTER: (context) =>
                          const MobileRegisterView()
                    }
                  : Platform.isLinux || Platform.isMacOS || Platform.isWindows
                      ? {
                          AppRoute.DESKTOP_PRESENTATION: (context) =>
                              const PresentationView(),
                          AppRoute.HOME_DESKTOP: (context) =>
                              const PresentationView()
                        }
                      : {})),
    );
  }
}
