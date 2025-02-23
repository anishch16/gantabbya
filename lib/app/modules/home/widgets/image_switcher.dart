import 'dart:async';
import 'package:flutter/material.dart';

import '../../../data/remote/api_urls.dart';
import '../../../utils/preview_image_card.dart';

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});

  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  late Timer _timer;
  int _firstIndex = 0;
  int _secondIndex = 1;
  int _thirdIndex = 2;

  // Define multiple image URLs to switch between
  final List<String> imageUrls = [
    ApiUrls.dummyImage,
    ApiUrls.dummyHotelImage,
    ApiUrls.dummyDestinationImage,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitchTimer();
  }

  void _startImageSwitchTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        int nextFirstIndex = (_firstIndex + 1) % imageUrls.length;
        int nextSecondIndex = (_secondIndex + 1) % imageUrls.length;
        int nextThirdIndex = (_thirdIndex + 1) % imageUrls.length;
        _firstIndex = nextFirstIndex;
        _secondIndex = nextSecondIndex;
        _thirdIndex = nextThirdIndex;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: ClipOval(
                key: ValueKey<int>(_firstIndex),
                child: PreviewCardImage(
                  height: 80,
                  width: 80,
                  url: imageUrls[_firstIndex],
                  errorImage: const AssetImage(ApiUrls.dummyImage),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: ClipOval(
                key: ValueKey<int>(_secondIndex),
                child: PreviewCardImage(
                  height: 80,
                  width: 80,
                  url: imageUrls[_secondIndex],
                  errorImage: const AssetImage(ApiUrls.dummyImage),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8.0),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: ClipOval(
            key: ValueKey<int>(_thirdIndex),
            child: PreviewCardImage(
              height: 100,
              width: 100,
              url: imageUrls[_thirdIndex],
              errorImage: const AssetImage(ApiUrls.dummyImage),
            ),
          ),
        ),
      ],
    );
  }
}
