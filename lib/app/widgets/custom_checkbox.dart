import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';


class CustomCheckBox extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(List<String>) onValuesChanged;

  const CustomCheckBox({super.key, 
    required this.title,
    required this.options,
    required this.onValuesChanged,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.smallStyle.copyWith(
              color: AppColors.grey.shade600, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: widget.options
              .map(
                (option) => CheckboxListTile(
                  title: Text(option),
                  value: selectedOptions.contains(option),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          selectedOptions.add(option);
                        } else {
                          selectedOptions.remove(option);
                        }
                        widget.onValuesChanged(selectedOptions);
                      }
                    });
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
