import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Pages {
  splash(path: '/splash', name: 'Splash-Page'),
  onBoarding(path: '/on_boarding', name: 'On-Boarding-Page'),
  login(path: '/login', name: 'Login-Page'),
  home(path: '/home', name: 'Home-Page'),
  pageOne(path: 'page_one', name: 'Page-One'),
  pageTwo(path: 'page_two', name: 'Page-Two'),;

  const Pages({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;

  @override
  String toString() => 'Page path: $path, name: $name';
}

final pagePathAndNameProvider = StateProvider<PagePathAndName>(
  (ref) => PagePathAndName(
    path: Pages.splash.path,
    name: Pages.splash.name,
  ),
);

class PagePathAndName {
  final String path;
  final String name;

  const PagePathAndName({
    required this.path,
    required this.name,
  });

  @override
  String toString() => 'PagePathAndName{path: $path, name: $name}';

  @override
  bool operator ==(covariant PagePathAndName other) {
    if (identical(this, other)) return true;

    return other.path == path && other.name == name;
  }

  @override
  int get hashCode => path.hashCode ^ name.hashCode;
}
