import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomDatePicker extends StatefulWidget {
  final int? firstDate;
  final int? lastDateYear;
  final int? lastDateMonth;
  final int? lastDateDay;
  final String title;
  final TextEditingController date;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomDatePicker({super.key,required this.title, required this.date,this.validator,this.onChanged, this.firstDate, this.lastDateYear, this.lastDateMonth,this.lastDateDay});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.date,
      validator: widget.validator,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintText: widget.title,
        hintStyle: AppTextStyles.smallStyle.copyWith(color: AppColors.grey),
        prefixIcon: const Icon(Icons.calendar_today),
        prefixIconColor: AppColors.grey,
      ),
      readOnly: true,

      //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(widget.firstDate ?? 1900 ),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime((widget.lastDateYear ?? 2100), (widget.lastDateMonth ?? 1), (widget.lastDateDay ?? 1))
        );

        if (pickedDate != null) {
          print(
              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(
              formattedDate); //formatted date output using intl package =>  2021-03-16
          setState(() {
            widget.date.text = formattedDate;
            widget.onChanged?.call(formattedDate);  // Pass the formatted date to the callback
            //set output date to TextField value.
          });
        } else {}
      },
    );
  }
}
