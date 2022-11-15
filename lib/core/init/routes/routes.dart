import 'package:animations/view/empty/empty_view.dart';
import 'package:animations/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

animationPage({required GoRouterState state, required Widget route}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: route,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
        ),
        child: child,
      ),
    );

final routes = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return animationPage(
          state: state,
          route: const HomeView(),
        );
      },
      routes: [
        GoRoute(
          path: 'empty',
          pageBuilder: (context, state) {
            return animationPage(
              state: state,
              route: const EmptyView(),
            );
          },
        ),
      ],
    ),
  ],
);
