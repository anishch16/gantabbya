import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
        child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0),
            child: Column(
              children: [
                const ProfilCardShimmer(),
                Shimmer.fromColors(
                  baseColor: Colors.white12,
                  highlightColor: Colors.transparent,
                  period: const Duration(milliseconds: 800),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      PersonalInfoShimmerCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      OtherShimmerCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      OtherShimmerCard(),
                      SizedBox(
                        height: 20.0,
                      ),
                      OtherShimmerCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const LogOutShimmer()
              ],
            ),
          ),
        ));
  }
}

class ProfilCardShimmer extends StatelessWidget {
  const ProfilCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Your original ProfilCardShimmer
        Shimmer.fromColors(
          baseColor: Colors.white12,
          highlightColor: Colors.transparent,
          period: const Duration(milliseconds: 800),
          child: Container(
            margin: EdgeInsets.only(top: Adaptive.h(8), bottom: 8),
            width: double.infinity,
            height: Adaptive.h(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                  offset: const Offset(0, 1),
                ),
              ],
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top:
          Adaptive.h(6.1),
          // bottom: Adaptive.h(0.4),
          child: Column(
            children: [
              CircleAvatar(
                radius: Adaptive.h(16)/2,
                backgroundColor: AppColors.white,
                child: Icon(
                  Icons.person_2_rounded,
                  size: Adaptive.h(16),
                  color: AppColors.appGrey.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ],
    );
  }
}

class PersonalInfoShimmerCard extends StatelessWidget {
  const PersonalInfoShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: Adaptive.h(45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 0.2,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
    );
  }
}

class OtherShimmerCard extends StatelessWidget {
  const OtherShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: Adaptive.h(35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 0.2,
            offset: const Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
    );
  }
}

class LogOutShimmer extends StatelessWidget {
  const LogOutShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Shimmer.fromColors(
          baseColor: Colors.white12,
          highlightColor: Colors.transparent,
          period: const Duration(milliseconds: 800),
          child: Container(
            width: double.infinity,
            height: Adaptive.h(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 0.2,
                  offset: const Offset(0, 1),
                ),
              ],
              color: Colors.white,
            ),
          ),
        );
  }
}

