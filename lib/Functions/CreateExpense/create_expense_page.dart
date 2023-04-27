import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../widgets/rounded_corner_button.dart';
import '../LeaveRequest/Widgets/leave_date_item.dart';

class CreateExpensePage extends StatefulWidget {
  const CreateExpensePage({Key? key}) : super(key: key);

  @override
  State<CreateExpensePage> createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  String dateFrom = "Date";
  String? selected;
  final amountsController = TextEditingController();
  final remarksController = TextEditingController();

  File? filename;

  List<DateTime?> _dates = [];

  @override
  void dispose() {
    amountsController.dispose();
    remarksController.dispose();
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
          "Create Expense",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Builder(builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
          ),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (!mounted) return;
                    pickUpDate(context);
                  },
                  child: LeaveDateItem(dateFrom: dateFrom),
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
                      SizedBox(
                        width: 75.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selected,
                            items: <String>[
                              'Food',
                              'Travel',
                              'Others',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
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
                      ),
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
                    controller: amountsController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.monetization_on,
                        color: Colors.black,
                      ),
                      hintText: "Amount",
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
                    controller: remarksController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.note,
                        color: Colors.black,
                      ),
                      hintText: "Remarks",
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
                GestureDetector(
                  onTap: () async {
                    if (await Permission.storage.request().isGranted) {
                      if (!mounted) return;
                      pickFile(context);
                    } else {
                      if (!mounted) return;
                      CherryToast.error(
                              title: Text(
                                "Permission Not granted",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.red,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              // displayTitle: false,
                              description: Text(
                                "We require storage permissions to pick up files",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                              ),
                              animationType: AnimationType.fromTop,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              autoDismiss: true)
                          .show(context);
                    }
                  },
                  child: LeaveDateItem(
                    dateFrom: filename?.path.split("/").last ?? "Choose Image",
                    icon: Icons.file_present,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                RoundedCornerButton(txt: "Submit", onClick: () {}),
              ],
            ),
          ),
        );
      }),
    );
  }

  void pickFile(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        filename = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
      CherryToast.error(
              title: Text(
                "No File was picked",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.red,
                      fontSize: 14.sp,
                    ),
              ),
              // displayTitle: false,
              description: Text(
                "You cancelled the process",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
              ),
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
    }
  }

  Future<void> pickUpDate(BuildContext context) async {
    List<DateTime?>? results = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
      ),
      dialogSize: const Size(325, 400),
      value: _dates,
      borderRadius: BorderRadius.circular(15),
    );
    if (results!.isNotEmpty) {
      setState(() {
            dateFrom = DateFormat("dd/MM/yyyy").format(results[0]!);
          });
    }
  }
}
