import 'package:animations/core/components/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          buttonText: "TURN BACK",
          onTap: () {
            context.pop();
          },
        ),
      ),
    );
  }
}
