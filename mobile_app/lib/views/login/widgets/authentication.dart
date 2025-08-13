import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/core/constant/colors.dart';
import 'package:smart_home/views/dashboard/UI/dashboard_screen.dart';

class GoogleAuthCard extends StatelessWidget {
  const GoogleAuthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        width: 350.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle Google Sign-In

                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 800),
                    pageBuilder: (context, animation, secondaryAnimation) => const DashboardScreen(user: 'Isel',),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );

              
              
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                side: const BorderSide(
                  color: Color.fromARGB(146, 206, 205, 205),
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                minimumSize: const Size(double.infinity, 56),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(
                      FontAwesomeIcons.chrome,
                      color: AppColors.iconColor,
                      size: 16.r,
                    ),
                  ),
                   SizedBox(width: 12.w),
                   Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.black87, fontSize: 16.sp),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20.h),
             Text(
              '🔐 Secure authentication with Google OAuth',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: Color.fromARGB(255, 115, 114, 114),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
