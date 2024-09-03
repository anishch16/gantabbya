import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FileUpload extends StatelessWidget {
  const FileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result =
            await FilePicker.platform.pickFiles(allowMultiple: true);

        if (result != null) {
          List<File> files = result.paths.map((path) => File(path!)).toList();
        } else {
          // User canceled the picker
        }
      },
      child: DottedBorder(
        color: const Color.fromRGBO(170, 181, 241, 1),
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        strokeWidth: 1,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/images/fileUpload.svg"),
                const SizedBox(
                  height: 10,
                ),
                const Text("Drag your file here"),
              ],
            ),
          ),
        ),
      ),
    );

    // Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(100.0),
    //     child: Center(
    //       child: Column(
    //         children: [
    //           Text("Drag your file here"),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
