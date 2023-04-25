import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: Container(
        height: 14.sp,
        width: 14.sp,
        margin: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.w,),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        // padding: EdgeInsets.all(1.w),
        child: const Icon(
          Icons.people,
          color: Colors.white,
          // size: 18.sp,
          // fill: 1,
        ),
      ),
      title: Text(
        "Dashboard",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chat,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}