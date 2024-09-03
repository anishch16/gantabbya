import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LibraryShimmer extends StatelessWidget {
  const LibraryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
      child: SizedBox(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.transparent,
                        period: const Duration(milliseconds: 800),
                        child: const LibraryCardShimmer());
                  },
                  itemCount: 5,
                  gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.86,
                      crossAxisSpacing: 12),
                ),
              ),
            ],
          )),
    );
  }
}

class LibraryCardShimmer extends StatelessWidget {
  const LibraryCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
          ),
        )

    );
  }
}