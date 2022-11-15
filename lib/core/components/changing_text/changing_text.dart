import 'package:animations/core/components/text/custom_text.dart';
import 'package:animations/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ChangingText extends StatefulWidget {
  const ChangingText(this.text, {super.key});

  final String text;

  @override
  State<ChangingText> createState() => _ChangingTextState();
}

class _ChangingTextState extends State<ChangingText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late TextStyleTween _styleTween;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    )..repeat(reverse: true);
    _styleTween = TextStyleTween(
      begin: GoogleFonts.poppins(
        fontSize: 15.sp,
        color: AppConstants.java,
      ),
      end: TextStyle(
        fontSize: 15.sp,
        color: AppConstants.bittersweet,
      ),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyleTransition(
        style: _styleTween.animate(_curvedAnimation),
        child: CustomText(widget.text),
      ),
    );
  }
}
