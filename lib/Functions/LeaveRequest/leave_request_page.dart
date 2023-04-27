import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
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
  String? selected;
  final commentController = TextEditingController();

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
              LeaveDateItem(dateFrom: dateFrom),
              LeaveDateItem(dateFrom: dateTo),
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
                            'General Leave',
                            'Casual Leave',
                            'Medical Leave',
                            'Unpaid Leave'
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
              RoundedCornerButton(txt: "Submit", onClick: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
