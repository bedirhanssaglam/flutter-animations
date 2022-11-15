import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoritesButton extends StatefulWidget {
  const FavoritesButton({super.key});

  @override
  State<FavoritesButton> createState() => _FavoritesButtonState();
}

class _FavoritesButtonState extends State<FavoritesButton>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 10.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.grey,
            blurRadius: 1,
          ),
        ],
      ),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => GestureDetector(
                child: isFavorite
                    ? AnimatedSwitcher(
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.favorite,
                          size: 3.7.h,
                          color: Colors.red,
                          key: const ValueKey('isFav'),
                        ))
                    : AnimatedSwitcher(
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 3.7.h,
                          color: Colors.grey,
                          key: const ValueKey('isNotFav'),
                        ),
                      ),
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              )),
    );
  }
}
