import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckInWidget extends StatelessWidget {
  const CheckInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
        ),
        height: 6.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Check In",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              Icons.logout,
              color: Colors.white,
              size: 14.sp,
            ),
          ],
        ),
      ),
    );
  }
}
