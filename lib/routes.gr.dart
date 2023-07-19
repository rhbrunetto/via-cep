// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ava/features/address/models/address.dart' as _i7;
import 'package:ava/features/address/presentation/address_form_screen.dart'
    as _i3;
import 'package:ava/features/address/presentation/address_list_screen.dart'
    as _i5;
import 'package:ava/features/address/presentation/address_screen.dart' as _i4;
import 'package:ava/features/sign_in/sign_in.dart' as _i2;
import 'package:ava/ui/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInScreen(),
      );
    },
    AddressFormRoute.name: (routeData) {
      final args = routeData.argsAs<AddressFormRouteArgs>(
          orElse: () => const AddressFormRouteArgs());
      return _i6.AutoRoutePage<_i7.AddressData>(
        routeData: routeData,
        child: _i3.AddressFormScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    AddressRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AddressScreen(),
      );
    },
    AddressListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AddressListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInScreen]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddressFormScreen]
class AddressFormRoute extends _i6.PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    _i8.Key? key,
    _i7.AddressData? data,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          AddressFormRoute.name,
          args: AddressFormRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressFormRoute';

  static const _i6.PageInfo<AddressFormRouteArgs> page =
      _i6.PageInfo<AddressFormRouteArgs>(name);
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({
    this.key,
    this.data,
  });

  final _i8.Key? key;

  final _i7.AddressData? data;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i4.AddressScreen]
class AddressRoute extends _i6.PageRouteInfo<void> {
  const AddressRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AddressListScreen]
class AddressListRoute extends _i6.PageRouteInfo<void> {
  const AddressListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AddressListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
