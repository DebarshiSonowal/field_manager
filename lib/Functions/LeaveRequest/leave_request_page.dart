import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_manager/Api/api_provider.dart';
import 'package:field_manager/Models/leaveType.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../Repository/Repository.dart';
import '../../widgets/rounded_corner_button.dart';
import 'Widgets/leave_date_item.dart';

class LeaveRequestPage extends StatefulWidget {
  const LeaveRequestPage({Key? key}) : super(key: key);

  @override
  State<LeaveRequestPage> createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  String dateFrom = "From";
  String dateTo = "To";
  int? selected;
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getLeaveTypes(context));
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

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
          "Leave Request",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
        ),
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LeaveDateItem(
                dateFrom: dateFrom,
                updateDate: (String val) {
                  if (DateTime.parse(val).isAfter(DateTime.now()) &&
                      (dateTo != "To"
                          ? DateTime.parse(val)
                              .isBefore(DateFormat("yyyy-MM-dd").parse(dateTo))
                          : true)) {
                    setState(() {
                      dateFrom =
                          DateFormat("yyyy-MM-dd").format(DateTime.parse(val));
                    });
                  } else {
                    if (!context.mounted) {
                      return;
                    }
                    CherryToast.error(
                            title: Text(
                              "Oops! Please pick a date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            displayTitle: true,
                            description: Text(
                              "Pickup a date after today's date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black45,
                                    fontSize: 9.sp,
                                  ),
                            ),
                            animationType: AnimationType.fromTop,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            autoDismiss: true)
                        .show(context);
                  }
                },
              ),
              LeaveDateItem(
                dateFrom: dateTo,
                updateDate: (String val) {
                  if (DateTime.parse(val).isAfter(DateTime.now()) &&
                      (dateFrom != "From"
                          ? DateTime.parse(val)
                              .isAfter(DateFormat("yyyy-MM-dd").parse(dateFrom))
                          : true)) {
                    setState(() {
                      dateTo =
                          DateFormat("yyyy-MM-dd").format(DateTime.parse(val));
                    });
                  } else {
                    if (!context.mounted) {
                      return;
                    }
                    CherryToast.error(
                            title: Text(
                              "Oops! Please pick a date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            displayTitle: true,
                            description: Text(
                              "Pickup a date after today's date and after from date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black45,
                                    fontSize: 9.sp,
                                  ),
                            ),
                            animationType: AnimationType.fromTop,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            autoDismiss: true)
                        .show(context);
                  }
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 1.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 0.5.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.book,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Consumer<Repository>(builder: (context, data, _) {
                      return SizedBox(
                        width: 75.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: selected,
                            items: data.leaveTypes.map((LeaveType value) {
                              return DropdownMenuItem(
                                value: value.id,
                                child: Text(
                                  value.leaveName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 14.sp,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {
                              setState(() {
                                selected = _;
                              });
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 0.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 0.5.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  controller: commentController,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                        // fontWeight: FontWeight.bold,
                      ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: const Icon(
                      Icons.comment,
                      color: Colors.black,
                    ),
                    hintText: "Comment",
                    hintStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.black,
                              fontSize: 14.sp,
                              // fontWeight: FontWeight.bold,
                            ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              RoundedCornerButton(
                  txt: "Submit",
                  onClick: () {
                    if (selected != null) {
                      askForLeave(context);
                    } else {}
                  }),
            ],
          ),
        ),
      ),
    );
  }

  getLeaveTypes(BuildContext context) async {
    final response = await ApiProvider.instance.getAllLeaveType();
    if (response.error ?? true) {
    } else {
      if (!context.mounted) {
        return;
      }
      Provider.of<Repository>(context, listen: false)
          .setTypeOfLeaves(response.leaveTypes ?? []);
    }
  }

  void askForLeave(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    final response = await ApiProvider.instance.addLeaveRequest(
      dateFrom,
      dateTo,
      selected!,
      commentController.text,
    );
    if (response.error ?? true) {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.error(
              title: Text(
                "Oops! Leave Request Failed",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
              ),
              displayTitle: true,
              description: Text(
                response.message ?? "Something went wrong",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black45,
                      fontSize: 10.sp,
                    ),
              ),
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
    } else {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.success(
              title: Text(
                "Leave Request Added Successfully",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
              ),
              displayTitle: true,
              description: Text(
                response.message ?? "Successfully ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black45,
                      fontSize: 10.sp,
                    ),
              ),
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
      Future.delayed(const Duration(seconds: 3),()=>Navigation.instance.navigateAndReplace(
          Routes.leavePage));
    }
  }
}
