import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    super.key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: 1.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: position < currentIndex
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                  animation: animController,
                  builder: (context, child) {
                    return Container(
                      height: 1.0,
                      width: constraints.maxWidth * animController.value,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.8,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    );
                  },
                )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
