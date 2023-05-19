import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckInWidget extends StatelessWidget {
  const CheckInWidget({
    super.key,
    required this.isCheckedIn,
    required this.checkIn,
    required this.checkOut,
  });

  final bool isCheckedIn;
  final Function checkIn, checkOut;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isCheckedIn ? checkOut() : checkIn(),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            color: isCheckedIn ? Colors.redAccent : Colors.deepPurple,
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
                isCheckedIn ? "Checked Out" : "Check In",
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
      ),
    );
  }
}
