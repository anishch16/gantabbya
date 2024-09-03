import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final List<String> options;
  final Function(String) onValueChanged;

  const CustomRadioButton({super.key, 
    required this.title,
    required this.options,
    required this.onValueChanged,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        Column(
          children: widget.options
              .map(
                (option) => RadioListTile(
              title: Text(option),
              value: option,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as String;
                  widget.onValueChanged(selectedOption);
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
