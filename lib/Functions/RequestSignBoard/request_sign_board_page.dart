import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../widgets/rounded_corner_button.dart';

class RequestSignBoardPage extends StatefulWidget {
  const RequestSignBoardPage({Key? key}) : super(key: key);

  @override
  State<RequestSignBoardPage> createState() => _RequestSignBoardPageState();
}

class _RequestSignBoardPageState extends State<RequestSignBoardPage> {
  String? selected;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final remarksController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
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
          "Request Sign Board",
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
            horizontal: 2.w,
          ),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                        Icons.man,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      SizedBox(
                        width: 70.w,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selected,
                            items: <String>[
                              'Nabajit',
                              'Lakshya',
                              'Biman',
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
                    controller: nameController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Name",
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
                    controller: addressController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.location_history,
                        color: Colors.black,
                      ),
                      hintText: "Address",
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
                    controller: heightController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.signpost,
                        color: Colors.black,
                      ),
                      hintText: "Height",
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
                    controller: widthController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.signpost,
                        color: Colors.black,
                      ),
                      hintText: "Width",
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
        );
      }),
    );
  }
}
