import 'package:animations/core/components/animated_text/animated_text.dart';
import 'package:animations/core/components/button/custom_button.dart';
import 'package:animations/core/components/button/favorites_button.dart';
import 'package:animations/core/components/changing_text/changing_text.dart';
import 'package:animations/core/components/text/custom_text.dart';
import 'package:animations/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/popup/showAnimatedPopup/show_animated_popup.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          children: [
            15.h.ph,
            CustomButton(
              onTap: () => showAnimatedPopup(context),
              buttonText: "CLICK ME",
            ),
            5.h.ph,
            const FavoritesButton(),
            5.h.ph,
            CustomButton(
              buttonText: "Other Page",
              onTap: () {
                context.go('/home/empty');
              },
            ),
            5.h.ph,
            AnimatedText(
              "This is an animated text.",
              textStyle: TextStyle(
                fontSize: 13.sp,
              ),
            ),
            5.h.ph,
            const ChangingText("CHANGING TEXT"),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const CustomText("Flutter Animations"),
    );
  }
}
