import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class LeaveDateItem extends StatelessWidget {
  const LeaveDateItem({
    super.key,
    required this.dateFrom,
    this.icon,
    required this.updateDate,
  });

  final IconData? icon;
  final String dateFrom;
  final Function(String) updateDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //get today's date
            firstDate: DateTime(2000),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(DateTime.now().year + 100),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: Colors.green,
                  // accentColor: const Color(0xFF8CE7F1),
                  colorScheme: const ColorScheme.light(primary: Colors.green),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            });
        if (pickedDate != null) {
          debugPrint("Selected date: $pickedDate");
          updateDate(pickedDate.toString());
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
          vertical: 2.h,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 0.5.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon ?? Icons.calendar_month,
              color: Colors.black,
            ),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              width: 70.w,
              child: Text(
                dateFrom,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
