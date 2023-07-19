import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/account/services/account_bloc.dart';
import 'routes.dart';
import 'routes.gr.dart';
import 'ui/theme.dart';

class AvaApp extends StatefulWidget {
  const AvaApp({super.key});

  @override
  State<AvaApp> createState() => _AvaAppState();
}

class _AvaAppState extends State<AvaApp> {
  final _router = AppRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<AccountBloc, bool>(
      (bloc) => bloc.state.maybeMap(orElse: F, processing: T),
    );
    final isAuthenticated = context.select<AccountBloc, bool>(
      (bloc) => bloc.state.maybeMap(orElse: F, loaded: T),
    );

    return MaterialApp.router(
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate.declarative(
        _router,
        routes: (_) => [
          // TODO(rhbrunetto): fix navigation
          if (isAuthenticated)
            const AddressRoute()
          else if (isLoading)
            const SplashRoute()
          else
            // const SignInRoute(),
            const AddressRoute()
        ],
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // TODO(rhbrunetto): fix locales (en, br)
      supportedLocales: AppLocalizations.supportedLocales,
      theme: const AvaThemeData.dark().toMaterialTheme(),
      title: 'AVA Via Cep',
    );
  }
}
