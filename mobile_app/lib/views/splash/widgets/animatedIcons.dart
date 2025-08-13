import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedFeatureIcon extends StatefulWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final Duration delay;
  final Color? iconColor;

  const AnimatedFeatureIcon({
    super.key,
    required this.icon,
    required this.iconBackgroundColor,
    this.delay = Duration.zero,
    this.iconColor,
  });

  @override
  State<AnimatedFeatureIcon> createState() => _AnimatedFeatureIconState();
}

class _AnimatedFeatureIconState extends State<AnimatedFeatureIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: widget.iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(widget.icon, size: 18.r, color: widget.iconColor ?? Colors.white),
),
        ),
      ),
    );
  }
}
