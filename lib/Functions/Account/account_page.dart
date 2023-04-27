import 'package:cached_network_image/cached_network_image.dart';
import 'package:field_manager/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../widgets/rounded_corner_button.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);
  var listIcon = [
    Icons.format_paint,
    Icons.notification_add,
    Icons.info,
    Icons.star,
    Icons.send,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigation.instance.goBack();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Account",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Consumer<Repository>(builder: (context, data, _) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 30.w,
                  height: 15.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://googleflutter.com/sample_image.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  "Debarshi Sonowal",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SwitchListTile(
                  // tileColor: Colors.red,
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(2.w),
                        // height: 3.h,
                        // width: 5.w,
                        child: Icon(
                          Icons.format_paint,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Dark Theme',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                            ),
                      ),
                    ],
                  ),
                  value: data.isDark,
                  onChanged: (bool? value) {
                    Provider.of<Repository>(context, listen: false)
                        .changeTheme(value ?? false);
                  },
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.03.h,
                ),
                SwitchListTile(
                  // tileColor: Colors.red,
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(2.w),
                        // height: 3.h,
                        // width: 5.w,
                        child: Icon(
                          Icons.notification_add,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Notification',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                            ),
                      ),
                    ],
                  ),
                  value: data.notification,
                  onChanged: (bool? value) {
                    Provider.of<Repository>(context, listen: false)
                        .changeNotification(value ?? false);
                  },
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.03.h,
                ),
                ListTile(
                  onTap: () {},
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(2.w),
                        // height: 3.h,
                        // width: 5.w,
                        child: Icon(
                          Icons.info,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'About Us',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                            ),
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.only(
                      right: 2.w,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.purple,
                      size: 14.sp,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.03.h,
                ),
                ListTile(
                  onTap: () {},
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(2.w),
                        // height: 3.h,
                        // width: 5.w,
                        child: Icon(
                          Icons.star,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Rate Us',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 0.03.h,
                ),
                ListTile(
                  onTap: () {},
                  title: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(2.w),
                        // height: 3.h,
                        // width: 5.w,
                        child: Icon(
                          Icons.send,
                          size: 25.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Share App',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 13.sp,
                            ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                RoundedCornerButton(txt: "Logout", onClick: () {}),
                Text(
                  "V 1.0",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 13.sp,
                      ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}


