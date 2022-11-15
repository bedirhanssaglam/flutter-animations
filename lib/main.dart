import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/init/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Animations',
          theme: ThemeData.dark(),
          routerConfig: routes,
        );
      },
    );
  }
}
