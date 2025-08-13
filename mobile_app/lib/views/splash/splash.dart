import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/core/widgets/logo.dart';
import 'package:smart_home/views/login/login_Screen.dart';
import 'package:smart_home/views/splash/widgets/animatedIcons.dart';
import 'package:smart_home/views/splash/widgets/featureSplash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _featuresController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _textOpacity;

  bool showFeatureIcons = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
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

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);

    _featuresController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showFeatureIcons = true;
      });
      _logoController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1400), () {
      _textController.forward();
    });

    Future.delayed(const Duration(milliseconds: 2200), () {
      _featuresController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _featuresController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.splashGradient),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showFeatureIcons) ...[
              const Positioned(
                top: 150,
                left: 60,
                child: AnimatedFeatureIcon(
                  icon: FontAwesomeIcons.mobileScreen,
                  delay: Duration(milliseconds: 300),
                  iconBackgroundColor: Color(0xff51a2ff),
                ),
              ),
              Positioned(
                top: 230.h,
                right: 50.w,
                child: AnimatedFeatureIcon(
                  icon: FontAwesomeIcons.wifi,
                  delay: Duration(milliseconds: 500),
                  iconBackgroundColor: Color(0xff2b7fff),
                ),
              ),
              const Positioned(
                top: 330,
                left: 80,
                child: AnimatedFeatureIcon(
                  icon: FontAwesomeIcons.shieldHalved,
                  delay: Duration(milliseconds: 700),
                  iconBackgroundColor: Color(0xff615fff),
                ),
              ),
            ],

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _logoScale,
                  child: FadeTransition(
                    opacity: _logoOpacity,
                    child: LogoWidget(
                      width: 80.w,
                      height: 80.h,
                      background: Colors.white,
                      iconColor: AppColors.iconColor,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                SlideTransition(
                  position: _textSlide,
                  child: FadeTransition(
                    opacity: _textOpacity,
                    child: Column(
                      children: [
                        Text(
                          'SmartHome',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Your intelligent home companion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        SpinKitThreeBounce(color: Colors.white, size: 18.r),
                        SizedBox(height: 8.h),
                        Text(
                          "Initializing your smart home...",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                FadeTransition(
                  opacity: _featuresController,
                  child: ScaleTransition(
                    scale: _featuresController,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FeatureSplash(title: 'Bluetooth Ready'),
                        FeatureSplash(title: 'Secure Access'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
