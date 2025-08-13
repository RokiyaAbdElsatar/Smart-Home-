import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/core/widgets/logo.dart';
import 'package:smart_home/views/login/widgets/authentication.dart';
import 'package:smart_home/views/splash/widgets/animatedIcons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;
  late AnimationController _logoController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _textSlide;
  late Animation<double> _textOpacity;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);
    Future.delayed(const Duration(milliseconds: 1200), () {
      _textController.forward();
    });

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoScale = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    Future.delayed(const Duration(milliseconds: 1000), () {
      _logoController.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _opacityAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _logoScale,
                    child: FadeTransition(
                      opacity: _logoOpacity,
                      child:LogoWidget(
                        width: 65.w,
                        height: 65.h,
                        background: Colors.black,
                        iconColor: Colors.white,
                        iconSize: 40.r,
                      )
                    ),
                  ),

                 SizedBox(height: 20.h),

                  SlideTransition(
                    position: _textSlide,
                    child: FadeTransition(
                      opacity: _textOpacity,
                      child: Column(
                        children: [
                           Text(
                            'Welcome Back',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                   SizedBox(height: 8.h),

                  SlideTransition(
                    position: _textSlide,
                    child: FadeTransition(
                      opacity: _textOpacity,
                      child: Column(
                        children: [
                           Text(
                            "Sign in to control your smart home",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                   SizedBox(height: 24.h),
                  FadeTransition(
                    opacity: _textOpacity,
                    child: SlideTransition(
                      position: _textSlide,
                      child: const GoogleAuthCard(),
                    ),
                  ),
                   SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        spacing: 8.h,
                        children: [
                          AnimatedFeatureIcon(
                            icon: EvaIcons.shieldOutline,
                            iconColor: Color(0xff00a53e),
                            delay: Duration(milliseconds: 300),
                            iconBackgroundColor: Color(0xffdafbe6),
                          ),

                          SlideTransition(
                            position: _textSlide,
                            child: FadeTransition(
                              opacity: _textOpacity,
                              child: Text(
                                'Secure',
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8.h,
                        children: [
                          AnimatedFeatureIcon(
                            icon: FontAwesomeIcons.chrome,
                            iconColor: AppColors.iconColor,
                            delay: Duration(milliseconds: 300),
                            iconBackgroundColor: Color(0xffdbeafe),
                          ),
                          SlideTransition(
                            position: _textSlide,
                            child: FadeTransition(
                              opacity: _textOpacity,
                              child: Text(
                                'OAuth 2.0',
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                   SizedBox(height: 30.h),

                  SlideTransition(
                    position: _textSlide,
                    child: FadeTransition(
                      opacity: _textOpacity,
                      child: Column(
                        children: [
                           Text(
                            textAlign: TextAlign.center,
                            "Protected by Google's secure authentication\nBluetooth connectivity required for device control",
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 12.sp,
                            ),
                          ),
                           SizedBox(height: 8.h),
                           Text(
                            "Your intelligent home companion",
                            style: TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                           SizedBox(height: 15.h),
                           SpinKitThreeBounce(
                            color: Colors.white,
                            size: 18.r,
                          ),
                           SizedBox(height: 8.h),
                           Text(
                            "Initializing your smart home...",
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
