import 'package:field_manager/Constants/temporaryData.dart';
import 'package:field_manager/Models/attendance.dart';
import 'package:field_manager/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AttendanceInfoCard extends StatelessWidget {
  const AttendanceInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return data.getAttendance == null
          ? Container()
          : Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 1.h,
                  horizontal: 4.w,
                ),
                decoration: const BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Attendance Information",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            size: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var item = TemporaryData.attendanceList[index];

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              "${getCurrentDayInfo(index, data.getAttendance!)} Days",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: double.infinity,
                          child: Divider(
                            color: Colors.white,
                            thickness: 0.2,
                          ),
                        );
                      },
                      itemCount: TemporaryData.attendanceList.length,
                    ),
                  ],
                ),
              ),
            );
    });
  }

  getCurrentDayInfo(int index, Attendance attendance) {
    switch (index) {
      case 1:
        return attendance.halfDay;
      case 2:
        return attendance.absent;
      case 3:
        return attendance.weeklyOff;
      case 4:
        return attendance.onLeave;
      case 5:
        return attendance.available;
      default:
        return attendance.present;
    }
  }
}
