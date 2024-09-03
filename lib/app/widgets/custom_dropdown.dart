import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final Icon? dropdownIcon;
  final List<String> items;
  final ValueNotifier<String> stateValue;
  final Function(String) onValueChanged; // Callback function

  const CustomDropdown(
      {super.key, this.dropdownIcon,
      required this.items,
      required this.stateValue,
      required this.onValueChanged});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: DropdownButton(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              elevation: 1,
              isExpanded: true,
              value: widget.stateValue.value,
              underline: Container(),
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
        ],
      ),
    );
  }
}
