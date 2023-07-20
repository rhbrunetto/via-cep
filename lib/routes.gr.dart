// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:ava/features/address/models/address.dart' as _i11;
import 'package:ava/features/address/presentation/address_flow_route.dart'
    as _i6;
import 'package:ava/features/address/presentation/screens/address_form_screen.dart'
    as _i4;
import 'package:ava/features/address/presentation/screens/address_list_screen.dart'
    as _i5;
import 'package:ava/features/profile/presentation/screens/edit_profile_screen.dart'
    as _i9;
import 'package:ava/features/profile/presentation/screens/sign_up_screen.dart'
    as _i8;
import 'package:ava/features/profile/presentation/sign_up_flow_screen.dart'
    as _i7;
import 'package:ava/features/sign_in/presentation/screens/sign_in_screen.dart'
    as _i3;
import 'package:ava/features/sign_in/presentation/sign_in_flow_screen.dart'
    as _i2;
import 'package:ava/ui/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    SignInFlowRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInFlowScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInScreen(),
      );
    },
    AddressFormRoute.name: (routeData) {
      final args = routeData.argsAs<AddressFormRouteArgs>(
          orElse: () => const AddressFormRouteArgs());
      return _i10.AutoRoutePage<_i11.AddressData>(
        routeData: routeData,
        child: _i4.AddressFormScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    AddressListRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AddressListScreen(),
      );
    },
    AddressFlowRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AddressFlowScreen(),
      );
    },
    SignUpFlowRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignUpFlowScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.EditProfileScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInFlowScreen]
class SignInFlowRoute extends _i10.PageRouteInfo<void> {
  const SignInFlowRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignInFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInFlowRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInScreen]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AddressFormScreen]
class AddressFormRoute extends _i10.PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    _i12.Key? key,
    _i11.AddressData? data,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          AddressFormRoute.name,
          args: AddressFormRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressFormRoute';

  static const _i10.PageInfo<AddressFormRouteArgs> page =
      _i10.PageInfo<AddressFormRouteArgs>(name);
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({
    this.key,
    this.data,
  });

  final _i12.Key? key;

  final _i11.AddressData? data;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i5.AddressListScreen]
class AddressListRoute extends _i10.PageRouteInfo<void> {
  const AddressListRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddressListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressListRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AddressFlowScreen]
class AddressFlowRoute extends _i10.PageRouteInfo<void> {
  const AddressFlowRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddressFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressFlowRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpFlowScreen]
class SignUpFlowRoute extends _i10.PageRouteInfo<void> {
  const SignUpFlowRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpFlowRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.EditProfileScreen]
class EditProfileRoute extends _i10.PageRouteInfo<void> {
  const EditProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
