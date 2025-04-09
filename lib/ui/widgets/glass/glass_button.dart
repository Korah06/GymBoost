import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  const GlassButton({
    super.key,
    this.width = 200,
    this.height = 60,
    this.borderRadius = 20,
    this.color = Colors.white,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius border = BorderRadius.circular(borderRadius);

    return ClipRRect(
      borderRadius: border,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
            // Gradient and border
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: color.withValues(alpha: 0.1),
                  width: 1,
                ),
                borderRadius: border,
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.4),
                    color.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Ripple feedback with InkWell
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: border,
                splashColor: color.withValues(alpha: 0.2),
                highlightColor: color.withValues(alpha: 0.1),
                child: Center(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
