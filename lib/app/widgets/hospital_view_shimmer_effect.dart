import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HospitalsViewShimmer extends StatelessWidget {
  const HospitalsViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          child: Column(
            children: [
              SizedBox(
              child: Row(children: [
                const SizedBox(width:10 ),
                Shimmer.fromColors(
                  baseColor: Colors.white12,
                  highlightColor: Colors.transparent,
                  period: const Duration(milliseconds: 800),
                  child:           Container(
                      height: 30,
                      width: 60,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                        ),
                      ),
                  ),
                ),
                const SizedBox(width: 16),
                Shimmer.fromColors(
                  baseColor: Colors.white12,
                  highlightColor: Colors.transparent,
                  period: const Duration(milliseconds: 800),
                  child:Container(
                      height: 32,
                      width: 60,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                        ),
                      )),
                ),
                const SizedBox(height:40 ),
              ],),),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.transparent,
                        period: const Duration(milliseconds: 800),
                        child: const HospitalCardShimmer());
                  },
                  itemCount: 6,
                ),
              ),
            ],
          )),
    );
  }
}

class HospitalCardShimmer extends StatelessWidget {
  const HospitalCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
              height: 75,
              width: double.infinity,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                ),
              )),
        ],
      ),
    );
  }
}