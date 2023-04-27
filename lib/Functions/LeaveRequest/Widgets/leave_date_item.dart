import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LeaveDateItem extends StatelessWidget {
  const LeaveDateItem({
    super.key,
    required this.dateFrom,
    this.icon,
  });

  final IconData? icon;
  final String dateFrom;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
