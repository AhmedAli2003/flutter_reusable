import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../router/page_path_and_name.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).pushReplacementNamed(Pages.pageOne.name);
          },
          child: const Text('Go To Page One'),
        ),
      ),
    );
  }
}
