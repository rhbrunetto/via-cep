import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  deferredLoading: false,
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(
      page: AddressFlowRoute.page,
      children: [
        AutoRoute(page: AddressListRoute.page, initial: true),
        AutoRoute(page: AddressFormRoute.page),
      ],
    ),
    AutoRoute(page: SignInRoute.page),
  ];
}
