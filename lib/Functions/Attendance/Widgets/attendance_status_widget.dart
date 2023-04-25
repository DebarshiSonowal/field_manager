
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AttendanceStatusWidget extends StatelessWidget {
  const AttendanceStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 2.w,),
      height: 10.h,
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(vertical: 1.h),
              width: double.infinity,
              child: Center(
                child: Text(
                  "Attendance Status",
                  style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
          Text(
            "Check in to begin",
            style:
            Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}