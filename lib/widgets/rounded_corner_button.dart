import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedCornerButton extends StatelessWidget {
  const RoundedCornerButton({
    super.key,
    this.txt,
    required this.onClick,
    this.txtColor,
    this.bgColor,
  });

  final String? txt;
  final Color? txtColor;
  final Color? bgColor;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Card(
        // margin: EdgeInsets.symmetric(
        //     horizontal: 3.w, vertical: 1.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.deepPurple,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 1.5.h,
            horizontal: 6.w,
          ),
          // height: 5.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                txt ?? "Logout",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: txtColor ?? Colors.white,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}