part of 'app_router.dart';

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

  @override
  String toString() =>
      'TransitionDetails(transition: $transition, page: $page, name: $name, context: $context, state: $state, duration: $duration, reverseDuration: $reverseDuration, curve: $curve, reverseCurve: $reverseCurve)';
}
