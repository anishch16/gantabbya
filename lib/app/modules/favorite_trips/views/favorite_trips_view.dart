import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/favorite_trips_controller.dart';

class FavoriteTripsView extends GetView<FavoriteTripsController> {
  const FavoriteTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan.shade50.withOpacity(0.5),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(AppImages.logoPng)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            PreviewCardImage(
                              height: 80,
                              width: 100,
                              url:
                                  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                              radius: 16,
                              errorImage: AssetImage(
                                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pokhara',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  'Kathmandu',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),

                        IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: AppColors.red,)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
