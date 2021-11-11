// Ripple Animation for the record Button (Reusable any were)
import 'package:flutter/material.dart';
import 'dart:math';

class RippleAnimatedButton extends StatefulWidget {
  const RippleAnimatedButton({Key? key, required this.child,required this.volume}) : super(key: key);
  final Widget child ;
  final double volume ;

  @override
  _RippleAnimatedButtonState createState() => _RippleAnimatedButtonState();
}

class _RippleAnimatedButtonState extends State<RippleAnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    controller.stop();
    controller.reset();
    controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CustomPaint(
          painter: SpritePainter(
              animation: controller,
          volume: widget.volume),
          child: widget.child,
        ),
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> animation;
  final double volume;

  SpritePainter({required this.animation,required this.volume}) : super(repaint: animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(.0, 1.0);
    Color color = Colors.black87.withOpacity(opacity);

    double size = rect.width / 4;
    double area = size * size;
    double radius = sqrt((area * value) * ( 0.25 +volume));

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}