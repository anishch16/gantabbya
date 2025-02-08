import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmer extends StatelessWidget {
  const WeatherShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(7, (index) {
        return buildShimmerWidget(MediaQuery.of(context).size); // Shimmer loading for each forecast
      }),
    );
  }
}

Widget buildShimmerWidget(Size size) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          Container(
            width: size.width * 0.2,
            height: 20.0,
            color: Colors.white,
          ),
          SizedBox(width: size.width * 0.1),
          Container(
            width: size.width * 0.1,
            height: 20.0,
            color: Colors.white,
          ),
          Spacer(),
          Container(
            width: size.width * 0.1,
            height: 20.0,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
