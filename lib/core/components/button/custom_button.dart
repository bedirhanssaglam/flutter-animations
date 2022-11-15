import 'package:animations/core/components/text/custom_text.dart';
import 'package:animations/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.height = 5,
    this.width = 80,
    this.buttonColor = AppConstants.blue,
    required this.buttonText,
    this.textColor = Colors.black,
    this.fontSize = 12,
    required this.onTap,
  });

  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final String buttonText;
  final Color? textColor;
  final double? fontSize;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: Transform.scale(
        scale: _scale,
        child: Container(
          height: widget.height?.h,
          width: widget.width?.w,
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: CustomText(
              widget.buttonText,
              textStyle: TextStyle(
                color: widget.textColor,
                fontSize: widget.fontSize?.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
