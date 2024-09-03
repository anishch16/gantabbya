import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../utils/preview_image_card.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  UserProfileView({super.key});

  @override
  final controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
        decoration: BoxDecoration(
          color: Colors.cyan.shade50.withOpacity(0.5),
        ),
        child: Column(
          children: [

            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
            //   decoration: const BoxDecoration(
            //     color: Colors.transparent,
            //     borderRadius: BorderRadius.only(
            //         bottomRight: Radius.circular(20),
            //         bottomLeft: Radius.circular(20)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "User Name",
            //         style: normalStyle,
            //       )
            //     ],
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ClipOval(
                          child: PreviewCardImage(
                            height: 130,
                            width: 130,
                            url:
                                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                            errorImage: AssetImage(
                              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.person),
                                SizedBox(height: 8),
                                Icon(Icons.location_on_outlined),
                                SizedBox(height: 8),
                                Icon(Icons.business_center),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Anish Chaulagain",
                                  style: normalStyle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Panchkhal, kavre",
                                  style: normalStyle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Flutter Developer",
                                  style: normalStyle,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Planned Trips",
                          style: normalStyle,
                        ),
                        Obx(() {
                          return GestureDetector(
                              onTap: () {
                                controller.changelist();
                              },
                              child:
                              controller.lisView.value
                                  ? Row(
                                      children: [
                                        Text(
                                          "Grid View",
                                          style: normalStyle.copyWith(color: AppColors.blue),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.grid_on,color: AppColors.blue),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          "List View",
                                          style: normalStyle.copyWith(
                                              color: AppColors.blue
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.menu,color: AppColors.blue),
                                      ],
                                    ));
                        }),
                      ],
                    ),
                    Obx(() {
                      return controller.lisView.value
                          ? GridView.count(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List<Widget>.generate(30, (index) {
                                return GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const PreviewCardImage(
                                            height: 80,
                                            width: double.infinity,
                                            url:
                                                'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                            errorImage: AssetImage(
                                              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                            ),
                                          ),
                                          Padding(
                                            padding:  const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Point 1: ",
                                                      style: smallStyle,
                                                    ),
                                                    Text(
                                                      "Kathmandu",
                                                      style: smallStyle,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Point 2: ",
                                                      style: smallStyle,
                                                    ),
                                                    Text(
                                                      "Pokhara",
                                                      style: smallStyle,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Point 3: ",
                                                      style: smallStyle,
                                                    ),
                                                    Text(
                                                      "Mustang",
                                                      style: smallStyle,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Point 4: ",
                                                      style: smallStyle,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "Upper Mustang",
                                                        style: smallStyle,
                                                        maxLines: 1,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))
                          : ListView.separated(
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, rowIndex) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 1,
                                            offset: const Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.
                                      start,
                                      children: [
                                        const ClipOval(
                                          child: PreviewCardImage(
                                            height: 70,
                                            width: 70,
                                            url:
                                            'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                            errorImage: AssetImage(
                                              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Checkpoint 1: ",
                                                  style: smallStyle,
                                                ),
                                                Text(
                                                  "Kathmandu",
                                                  style: smallStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Checkpoint 2: ",
                                                  style: smallStyle,
                                                ),
                                                Text(
                                                  "Pokhara",
                                                  style: smallStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Checkpoint 3: ",
                                                  style: smallStyle,
                                                ),
                                                Text(
                                                  "Mustang",
                                                  style: smallStyle,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Checkpoint 4: ",
                                                  style: smallStyle,
                                                ),
                                                Text(
                                                  "Upper Mustang",
                                                  style: smallStyle,
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ));
                              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 16); },
                            );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
