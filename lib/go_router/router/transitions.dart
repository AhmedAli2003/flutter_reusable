part of 'app_router.dart';

enum Transitions {
  slideRightToLeft,
  slideLeftToRight,
  sizeBottomToTop,
  sizeTopToBottom,
  sizeLeftToRight,
  sizeRightToLeft,
  sizeCenterHorizontal,
  sizeCenterVertical,
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

CustomTransitionPage getCustomTransition(TransitionDetails details) {
  return switch (details.transition) {
    Transitions.slideRightToLeft => _getSlideTransition(details: details, leftToRight: false),
    Transitions.slideLeftToRight => _getSlideTransition(details: details, leftToRight: true),
    Transitions.sizeBottomToTop => _getSizeTransition(details: details),
    Transitions.sizeTopToBottom => _getSizeTransition(details: details),
    Transitions.sizeLeftToRight => _getSizeTransition(details: details),
    Transitions.sizeRightToLeft => _getSizeTransition(details: details),
    Transitions.sizeCenterHorizontal => _getSizeTransition(details: details),
    Transitions.sizeCenterVertical => _getSizeTransition(details: details),
    Transitions.scaleFromBottomCenter => _getScaleTransition(details: details),
    Transitions.scaleFromTopCenter => _getScaleTransition(details: details),
    Transitions.scaleFromLeftCenter => _getScaleTransition(details: details),
    Transitions.scaleFromRightCenter => _getScaleTransition(details: details),
    Transitions.scaleFromTopRight => _getScaleTransition(details: details),
    Transitions.scaleFromBottomRight => _getScaleTransition(details: details),
    Transitions.scaleFromTopLeft => _getScaleTransition(details: details),
    Transitions.scaleFromBottomLeft => _getScaleTransition(details: details),
    Transitions.fade => _getFadeTransition(details: details),
  };
}

CustomTransitionPage _getSlideTransition({
  required TransitionDetails details,
  bool leftToRight = false,
}) {
  return CustomTransitionPage(
    key: details.state.pageKey,
    transitionDuration: details.duration ?? Durations.long2,
    reverseTransitionDuration: details.reverseDuration ?? Durations.medium2,
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
    key: details.state.pageKey,
    name: details.name,
    transitionDuration: details.duration ?? Durations.medium2,
    reverseTransitionDuration: details.reverseDuration ?? Durations.medium2,
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
    key: details.state.pageKey,
    name: details.name,
    transitionDuration: details.duration ?? Durations.long2,
    reverseTransitionDuration: details.reverseDuration ?? Durations.medium2,
    child: details.page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: details.curve ?? Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn,
      );
      return Align(
        alignment: _getAxisAlignment(details.transition),
        child: SizeTransition(
          sizeFactor: curvedAnimation,
          axis: _getAxisForSizeTransition(details.transition),
          child: child,
        ),
      );
    },
  );
}

Alignment _getAxisAlignment(Transitions transition) {
  return switch (transition) {
    Transitions.slideRightToLeft => Alignment.center,
    Transitions.slideLeftToRight => Alignment.center,
    Transitions.sizeBottomToTop => Alignment.bottomCenter,
    Transitions.sizeTopToBottom => Alignment.topCenter,
    Transitions.sizeLeftToRight => Alignment.centerLeft,
    Transitions.sizeRightToLeft => Alignment.centerRight,
    Transitions.sizeCenterHorizontal => Alignment.center,
    Transitions.sizeCenterVertical => Alignment.center,
    Transitions.scaleFromBottomCenter => Alignment.bottomCenter,
    Transitions.scaleFromTopCenter => Alignment.topCenter,
    Transitions.scaleFromLeftCenter => Alignment.centerLeft,
    Transitions.scaleFromRightCenter => Alignment.centerRight,
    Transitions.scaleFromTopRight => Alignment.topRight,
    Transitions.scaleFromBottomRight => Alignment.bottomRight,
    Transitions.scaleFromTopLeft => Alignment.topLeft,
    Transitions.scaleFromBottomLeft => Alignment.bottomLeft,
    Transitions.fade => Alignment.center,
  };
}

Axis _getAxisForSizeTransition(Transitions transition) {
  if (transition == Transitions.sizeBottomToTop ||
      transition == Transitions.sizeTopToBottom ||
      transition == Transitions.sizeCenterVertical) {
    return Axis.vertical;
  } else {
    return Axis.horizontal;
  }
}

CustomTransitionPage _getScaleTransition({
  required TransitionDetails details,
}) {
  return CustomTransitionPage(
    key: details.state.pageKey,
    name: details.name,
    transitionDuration: details.duration ?? Durations.long2,
    reverseTransitionDuration: details.reverseDuration ?? Durations.medium2,
    child: details.page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: details.curve ?? Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        alignment: _getAxisAlignment(details.transition),
        child: child,
      );
    },
  );
}
