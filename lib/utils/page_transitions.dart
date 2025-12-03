import 'package:flutter/material.dart';

class RotatePageTransition extends PageRouteBuilder {
  final Widget page;

  RotatePageTransition({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondary, child) {
            const begin = 0.0;
            const end = 1.0;

            var rotate = Tween(begin: begin, end: end).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutCubic,
              ),
            );

            var scale = Tween<double>(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
            );

            return AnimatedBuilder(
              animation: rotate,
              builder: (context, childWidget) {
                double angle = rotate.value * 1.2; // 3D angle

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // 3D depth
                    ..rotateY(angle),        // Y-axis rotation
                  child: Transform.scale(
                    scale: scale.value,
                    child: childWidget,
                  ),
                );
              },
              child: child,
            );
          },
        );
}
