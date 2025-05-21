// utils/route_animations.dart
import 'package:flutter/material.dart';

class PageRouteAnimations {
  ///
  static Route fadeTransitionRoute(Widget page, {int durationMs = 250}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: durationMs),
    );
  }

  /// Add other animation types as needed
  static Route slideTransitionRoute(Widget page, {int durationMs = 300}) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: durationMs),
    );
  }
}
