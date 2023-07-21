// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:ava/features/address/models/address.dart' as _i12;
import 'package:ava/features/address/presentation/address_flow_route.dart'
    as _i8;
import 'package:ava/features/address/presentation/screens/address_form_screen.dart'
    as _i6;
import 'package:ava/features/address/presentation/screens/address_list_screen.dart'
    as _i7;
import 'package:ava/features/profile/presentation/profile_flow_screen.dart'
    as _i5;
import 'package:ava/features/profile/presentation/screens/edit_profile_screen.dart'
    as _i4;
import 'package:ava/features/sign_in/presentation/screens/sign_in_screen.dart'
    as _i3;
import 'package:ava/features/sign_in/presentation/sign_in_flow_screen.dart'
    as _i2;
import 'package:ava/features/sign_up/presentation/screens/sign_up_screen.dart'
    as _i10;
import 'package:ava/features/sign_up/presentation/sign_up_flow_screen.dart'
    as _i9;
import 'package:ava/ui/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    SignInFlowRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInFlowScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.EditProfileScreen(),
      );
    },
    ProfileFlowRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileFlowScreen(),
      );
    },
    AddressFormRoute.name: (routeData) {
      final args = routeData.argsAs<AddressFormRouteArgs>(
          orElse: () => const AddressFormRouteArgs());
      return _i11.AutoRoutePage<_i12.AddressData>(
        routeData: routeData,
        child: _i6.AddressFormScreen(
          key: args.key,
          data: args.data,
        ),
      );
    },
    AddressListRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AddressListScreen(),
      );
    },
    AddressFlowRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AddressFlowScreen(),
      );
    },
    SignUpFlowRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpFlowScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignUpScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInFlowScreen]
class SignInFlowRoute extends _i11.PageRouteInfo<void> {
  const SignInFlowRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInFlowRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.EditProfileScreen]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileFlowScreen]
class ProfileFlowRoute extends _i11.PageRouteInfo<void> {
  const ProfileFlowRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileFlowRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AddressFormScreen]
class AddressFormRoute extends _i11.PageRouteInfo<AddressFormRouteArgs> {
  AddressFormRoute({
    _i13.Key? key,
    _i12.AddressData? data,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          AddressFormRoute.name,
          args: AddressFormRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressFormRoute';

  static const _i11.PageInfo<AddressFormRouteArgs> page =
      _i11.PageInfo<AddressFormRouteArgs>(name);
}

class AddressFormRouteArgs {
  const AddressFormRouteArgs({
    this.key,
    this.data,
  });

  final _i13.Key? key;

  final _i12.AddressData? data;

  @override
  String toString() {
    return 'AddressFormRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i7.AddressListScreen]
class AddressListRoute extends _i11.PageRouteInfo<void> {
  const AddressListRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddressListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressListRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AddressFlowScreen]
class AddressFlowRoute extends _i11.PageRouteInfo<void> {
  const AddressFlowRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddressFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddressFlowRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpFlowScreen]
class SignUpFlowRoute extends _i11.PageRouteInfo<void> {
  const SignUpFlowRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpFlowRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
