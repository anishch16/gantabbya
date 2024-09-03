import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InventoryViewShimmer extends StatelessWidget {
  const InventoryViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          child: Column(
            children: [
              const SizedBox(height: 28),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white12,
                        highlightColor: Colors.transparent,
                        period: const Duration(milliseconds: 800),
                        child: const EquipmentCardShimmer());
                  },
                  itemCount: 1,
                ),
              ),
            ],
          )),
    );
  }
}

class EquipmentCardShimmer extends StatelessWidget {
  const EquipmentCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
              height: 52,
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