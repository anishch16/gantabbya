import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VitalShimmer extends StatelessWidget {
  const VitalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
          width: double.infinity,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 62),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.transparent,
                        period: const Duration(milliseconds: 800),
                        child: const VitalCardShimmer());
                  },
                  itemCount: 4,
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 12),
                ),
              ),
            ],
          )),
    );
  }
}

class VitalCardShimmer extends StatelessWidget {
  const VitalCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
          ),
        )

    );
  }
}