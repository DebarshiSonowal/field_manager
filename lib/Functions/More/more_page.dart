import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/more.dart';
import '../../widgets/custom_bottom_navigation.dart';

class MorePage extends StatelessWidget {
  MorePage({Key? key}) : super(key: key);

  var list = [
      More(name: "Expanses",icon: Icons.calculate),
      More(name: "Sign Board Request",icon: Icons.assignment),
      More(name: "Clients",icon: Icons.people),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "More",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
          horizontal: 2.w,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var item = list[index];
            return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(2.w),
                // height: 3.h,
                // width: 5.w,
                child: Icon(
                 item.icon,
                  size: 25.sp,
                ),
              ),
              title: Text(
                item.name??"",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 13.sp,
                    ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                  size: 12.sp,
                ),
                onPressed: () {},
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 0.009.h,
                color: Colors.black,
              ),
            );
          },
          itemCount: 3,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
