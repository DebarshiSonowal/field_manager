import 'package:field_manager/Models/user_shift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../Repository/Repository.dart';

class ShiftCard extends StatelessWidget {
  const ShiftCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return data.getUserShift==null?Container():Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 4.w,
          ),
          decoration: const BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shift",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${data.getUserShift!.startTime!.split(":")[0]}:${data.getUserShift!.startTime!.split(":")[1]}"
                    " - "
                    "${data.getUserShift!.endTime!.split(":")[0]}:${data.getUserShift!.endTime!.split(":")[1]}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 11.sp,
                          // fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(
                    // width: 70.w,
                    height: 4.h,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 7.w,
                            margin: EdgeInsets.symmetric(
                              horizontal: 1.w,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  getValueFromIndex(index, data.getUserShift!) ==
                                          0
                                      ? Colors.grey
                                      : Colors.green,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              // horizontal: 2.w,
                              vertical: 0.5.h,
                            ),
                            child: Center(
                              child: Text(
                                getDayOfTheWeek(index),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  String getDayOfTheWeek(int index) {
    switch (index) {
      case 0:
        return "S";
      case 1:
        return "M";
      case 2:
        return "T";
      case 3:
        return "W";
      case 4:
        return "T";
      case 5:
        return "F";
      default:
        return "S";
    }
  }

  getValueFromIndex(int index, UserShift userShift) {
    switch (index) {
      case 1:
        return userShift.monday;
      case 2:
        return userShift.tuesday;
      case 3:
        return userShift.wednesday;
      case 4:
        return userShift.thursday;
      case 5:
        return userShift.friday;
      case 6:
        return userShift.saturday;
      default:
        return userShift.sunday;
    }
  }
}
