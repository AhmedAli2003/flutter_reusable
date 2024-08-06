import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/page_path_and_name.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(Pages.pageTwo.name);
          },
          child: const Text('Go To Page Two'),
        ),
      ),
    );
  }
}
