import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/assets.dart';

class DashboardHeader extends StatefulWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader>
    with TickerProviderStateMixin {
  late FlutterGifController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // LottieBuilder.asset(
          //   Assets.dayAnimation,
          //   fit: BoxFit.fill,
          //   height: 40.h,
          //   width: 85.w,
          // ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 8.h,
              width: 15.w,
              child: FutureBuilder(
                future: initialization(),
                initialData: () {},
                builder: (context, _) {
                  return GifImage(
                    controller: controller,
                    // fit: BoxFit.fill,
                    height: 8.h,
                    width: 17.w,
                    image: const AssetImage(
                      Assets.dayAnimation,
                    ),
                  );
                },
              ),
            ),
          ),
          // SizedBox(
          //   width: 5.w,
          // ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
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
                Text(
                  "Today: ${DateFormat("dd-MM-yyyy").format(DateTime.now())}",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),

          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Future<String> initialization() async {
    controller = FlutterGifController(vsync: this);
    controller.animateTo(52);
    return Future.value(""); // return your response
  }
}
