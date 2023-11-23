import 'package:dashboard/presentation/dashboard/dashboard.dart';
import 'package:dashboard/presentation/registration/registration.dart';
import 'package:dashboard/router/appRoutesEnum.dart';
import 'package:dashboard/service/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../presentation/otp/otp.dart';

part 'appRoutes.dart';

typedef PopViewCallback = void Function(bool result);

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const OtpView();
      },
      redirect: (BuildContext context, GoRouterState state) async {
        // return AppRoutes.otp.routePath;
        // return AppRoutes.registration.routePath;
        return AppRoutes.dashboard.routePath;
      },
    ),
    _homeRoutes(),
    _registrationRoutes(),
    _otpRoutes(),
  ],
);
