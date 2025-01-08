import 'package:flutter/material.dart';
import 'package:gantabbya/app/constants/styles.dart';

import '../constants/colors.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final Icon? dropdownIcon;
  final List<String> items;
  final ValueNotifier<String> stateValue;
  final Function(String) onValueChanged; // Callback function

  const CustomDropdown(
      {super.key, this.dropdownIcon, required this.items, required this.title, required this.stateValue, required this.onValueChanged});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.smallStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              widget.dropdownIcon ?? Container(),
              const SizedBox(width: 4.0),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    key: dropdownKey,
                    menuWidth: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    elevation: 1,
                    dropdownColor: AppColors.white,
                    isExpanded: true,
                    value: widget.stateValue.value,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: widget.items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.stateValue.value = newValue!;
                        widget.onValueChanged(newValue); // Invoke the callback
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
