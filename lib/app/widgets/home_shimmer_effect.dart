import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
          // width: double.infinity,
          child:Column(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.white12,
                  highlightColor: Colors.transparent,
                  period: const Duration(milliseconds: 800),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(height: 50,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
                        ),
                      ),),
                  )),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.transparent,
                        period: const Duration(milliseconds: 800),
                        child: const HomeCardShimmer());
                  },
                  itemCount: 6,
                  gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10),
                ),
              ),
            ],
          )),
    );
  }
}

class HomeCardShimmer extends StatelessWidget {
  const HomeCardShimmer({super.key});

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