import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomFilePicker extends StatefulWidget {
  final String title;
  final Function(File?) onFilePicked;

  const CustomFilePicker(
      {super.key, required this.title, required this.onFilePicked});

  @override
  _CustomFilePickerState createState() => _CustomFilePickerState();
}

class _CustomFilePickerState extends State<CustomFilePicker> {
  File? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: smallStyle.copyWith(
              color: AppColors.grey.shade600, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        GestureDetector(
          onTap: () => pickFile(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: DottedBorder(
              color: AppColors.primary,
              dashPattern: const [8, 4],
              strokeWidth: 1,
              child: Container(
                alignment: Alignment.center,
                height: 120, // Adjust the height as needed
                width: double.infinity,
                child: _pickedFile != null
                    ? Image.file(
                        _pickedFile!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined),
                          Text(
                            "Drag your file here",
                            // style: veryTinyGreyStyle, // Define your style
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        File pickedFile = File(result.files.single.path!);
        setState(() {
          _pickedFile = pickedFile;
        });
        widget.onFilePicked(pickedFile);
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }
}
