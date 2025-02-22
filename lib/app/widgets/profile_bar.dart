import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/images.dart';


class ProfileBar extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController = TextEditingController();

  ProfileBar({super.key, required this.title});

  final localData = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 40,
              width: 40,
              child: Image.asset(AppImages.logoPng)),
          IconButton(onPressed: () {  }, icon: const Icon(Icons.menu),

          )

          // SvgPicture.asset(
          //   AppIcons.searchIcon,
          // ),
          // GestureDetector(
          //     onTap: () {
          //       // Get.to(() => ProfileView());
          //     },
          //     child: localData.read('imageUrl') == null
          //         ? CircleAvatar(
          //             radius: 18,
          //             child: ProfilePlaceHolderImage(
          //               title: localData.read('full_name') == null
          //                   ? "U"
          //                   : localData.read('full_name')[0],
          //               style: smallStyle,
          //             ))
          //         : CircleAvatar(
          //             radius: 18, // Adjust the radius as needed
          //             backgroundImage: CachedNetworkImageProvider(
          //               localData.read('imageUrl') ?? "",
          //             ),
          //             backgroundColor: Colors.transparent,
          //           )),
          // const SizedBox(width: 10),
          // Text(
          //   title,
          //   style: smallStyle.copyWith(
          //       color: Colors.white, fontWeight: FontWeight.bold),
          // ),
          // const Spacer(),
          // InkWell(
          //     onTap: () {
          //       // Get.to(()=>QrScanView(),transition: Transition.upToDown);
          //     },
          //     child: const Icon(Icons.qr_code_scanner,
          //         color: AppColors.white, size: 25)),
          // const SizedBox(width: 16),
          // InkWell(
          //     onTap: () {
          //       // Get.to(()=>const NotificationView());
          //     },
          //     child: const Icon(Icons.notifications_none_rounded,
          //         color: AppColors.white, size: 25)),
        ],
      ),
    );
  }
}

// }
