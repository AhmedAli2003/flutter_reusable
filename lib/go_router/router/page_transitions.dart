part of 'app_router.dart';

final pageTransitionsProvider = Provider<PageTransitions>(
  (ref) => PageTransitions(ref),
);

class PageTransitions {
  // ignore: unused_field
  final Ref _ref;

  const PageTransitions(Ref ref) : _ref = ref;

  Transitions getHomePageChildTransition() {
    return Transitions.slideLeftToRight;
  }
}
