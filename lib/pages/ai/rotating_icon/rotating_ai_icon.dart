import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
  const RotatingIcon({super.key});

  @override
  State<RotatingIcon> createState() => RotatingIconState();
}

class RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _colorAnimation = ColorTween(
      begin: Colors.amber,
      end: Colors.blue,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ionIcon',
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.1415926535,
            child: Icon(
              Icons.bubble_chart_outlined,
              color: _colorAnimation.value,
              size: 120,
            ),
          );
        },
      ),
    );
  }
}
