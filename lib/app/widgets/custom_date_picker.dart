import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomDatePicker extends StatefulWidget {
  final int? firstDateYear;
  final int? firstDateMonth;
  final int? firstDateDay;
  final int? lastDateYear;
  final int? lastDateMonth;
  final int? lastDateDay;
  final int? initialDateYear;
  final int? initialDateMonth;
  final int? initialDateDay;
  final String title;
  final TextEditingController date;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomDatePicker(
      {super.key,
      required this.title,
      required this.date,
      this.validator,
      this.onChanged,
      this.firstDateYear,
      this.firstDateMonth,
      this.firstDateDay,
      this.lastDateYear,
      this.lastDateMonth,
      this.lastDateDay,
      this.initialDateDay,
      this.initialDateMonth,
      this.initialDateYear
      });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 50,
      child: TextFormField(
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
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.black),
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: widget.title,
          hintStyle: AppTextStyles.smallStyle.copyWith(color: AppColors.grey),
          prefixIcon: const Icon(Icons.calendar_today),
          prefixIconColor: AppColors.grey,
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(
                  (widget.initialDateYear ?? DateTime.now().year),
                  (widget.initialDateMonth ?? DateTime.now().month),
                  (widget.initialDateDay ?? DateTime.now().day)),
              firstDate: DateTime((widget.firstDateYear ?? 1900),
                  (widget.firstDateMonth ?? 1), (widget.firstDateDay ?? 1)),
              lastDate: DateTime((widget.lastDateYear ?? 2100),
                  (widget.lastDateMonth ?? 1), (widget.lastDateDay ?? 1)));
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              widget.date.text = formattedDate;
              widget.onChanged?.call(formattedDate);
            });
          } else {}
        },
      ),
    );
  }
}
