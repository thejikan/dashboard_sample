part of 'router.dart';

GoRoute _otpRoutes() {
  return GoRoute(
    path: AppRoutes.otp.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: OtpView(),
      );
    },
  );
}

GoRoute _registrationRoutes() {
  return GoRoute(
    path: AppRoutes.registration.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: RegistrationView(),
        // child: MyHomePage(title: 'Flutter Demo Home Page'),
      );
    },
  );
}

GoRoute _homeRoutes() {
  return GoRoute(
    path: AppRoutes.dashboard.routePath,
    builder: (context, state) {
      return RepositoryProvider.value(
        value: serviceLocator.getDetailsService(),
        child: DashboardView(),
      );
    },
  );
}