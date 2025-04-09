import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final Widget? child;

  const GlassCard({
    super.key,
    this.width = 200,
    this.height = 200,
    this.color = Colors.white,
    this.borderRadius = 20,
    this.child,
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
            //blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(),
            ),
            //gradient Effect
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: color.withValues(alpha: 0.10),
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

            //CHILDREN
            Center(child: child,)
          ],
        ),
      ),
    );
  }
}
