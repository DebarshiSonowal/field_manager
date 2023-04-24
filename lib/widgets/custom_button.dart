import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, this.title, required this.onClick,
  });
  final String? title;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape:
        MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            // side: const BorderSide(color: Colors.red),
          ),
        ),
        backgroundColor:
        MaterialStateProperty.all(Colors.deepPurple),
      ),
      onPressed: ()=>onClick(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 1.5.h,
        ),
        child: Text(
          title??"Login",
          style:
          Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}