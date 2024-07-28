import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransitionDetails {
  final Transitions transition;
  final Widget page;
  final String name;
  final BuildContext context;
  final GoRouterState state;
  final Duration? duration;
  final Duration? reverseDuration;
  final Curve? curve;
  final Curve? reverseCurve;

  const TransitionDetails({
    required this.transition,
    required this.page,
    required this.name,
    required this.context,
    required this.state,
    this.duration,
    this.reverseDuration,
    this.curve,
    this.reverseCurve,
  });
}

enum Transitions {
  slideRightToLeft,
  slideLeftToRight,
  sizeBottomToTop,
  sizeTopToBottom,
  sizeLeftToRight,
  sizeRightToLeft,
  scaleFromBottomCenter,
  scaleFromTopCenter,
  scaleFromLeftCenter,
  scaleFromRightCenter,
  scaleFromTopRight,
  scaleFromBottomRight,
  scaleFromTopLeft,
  scaleFromBottomLeft,
  fade,
  // switcher,
}

class Durations {
  const Durations._();

  static const milliseconds300 = Duration(milliseconds: 300);
  static const milliseconds500 = Duration(milliseconds: 500);
  static const milliseconds750 = Duration(milliseconds: 750);
  static const milliseconds1000 = Duration(milliseconds: 1000);
  static const milliseconds1500 = Duration(milliseconds: 1500);
  static const milliseconds2000 = Duration(milliseconds: 2000);
}

CustomTransitionPage getCustomTransition(TransitionDetails details) {
  return switch (details.transition) {
    Transitions.slideRightToLeft => _getSlideTransition(details: details, leftToRight: false),
    Transitions.slideLeftToRight => _getSlideTransition(details: details, leftToRight: true),
    // TODO: Handle this case.
    Transitions.sizeBottomToTop => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.sizeTopToBottom => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.sizeLeftToRight => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.sizeRightToLeft => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromBottomCenter => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromTopCenter => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromLeftCenter => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromRightCenter => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromTopRight => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromBottomRight => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromTopLeft => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.scaleFromBottomLeft => throw UnimplementedError(),
    // TODO: Handle this case.
    Transitions.fade => _getFadeTransition(details: details),
  };
}

CustomTransitionPage _getSlideTransition({
  required TransitionDetails details,
  bool leftToRight = false,
}) {
  return CustomTransitionPage(
    transitionDuration: details.duration ?? Durations.milliseconds1000,
    reverseTransitionDuration: details.reverseDuration ?? Durations.milliseconds300,
    name: details.name,
    child: details.page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: details.curve ?? Curves.fastLinearToSlowEaseIn,
        reverseCurve: details.reverseCurve ?? Curves.fastOutSlowIn,
      );
      final begin = leftToRight ? const Offset(-1.0, 0.0) : const Offset(1.0, 0.0);
      return SlideTransition(
        position: Tween(begin: begin, end: Offset.zero).animate(curvedAnimation),
        child: child,
      );
    },
  );
}

CustomTransitionPage _getFadeTransition({
  required TransitionDetails details,
}) {
  return CustomTransitionPage(
    name: details.name,
    transitionDuration: details.duration ?? Durations.milliseconds300,
    reverseTransitionDuration: details.reverseDuration ?? Durations.milliseconds300,
    child: details.page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: details.curve ?? Curves.easeInOut,
        reverseCurve: details.reverseCurve,
      );
      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}

CustomTransitionPage _getSizeTransition({
  required TransitionDetails details,
}) {
  return CustomTransitionPage(
    name: details.name,
    transitionDuration: details.duration ?? Durations.milliseconds300,
    reverseTransitionDuration: details.reverseDuration ?? Durations.milliseconds300,
    child: details.page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: details.curve ?? Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn,
      );
      return SizeTransition(
        sizeFactor: curvedAnimation,
        // axisAlignment: _getAxisAlignment(details.transition),
        child: child,
      );
    },
  );
}

// double _getAxisAlignment(Transitions transition) {
//   if (transition == Transitions.size)
// }
