import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../widgets/rounded_corner_button.dart';
import '../LeaveRequest/Widgets/leave_date_item.dart';

class CreateClientsPage extends StatefulWidget {
  const CreateClientsPage({Key? key}) : super(key: key);

  @override
  State<CreateClientsPage> createState() => _CreateClientsPageState();
}

class _CreateClientsPageState extends State<CreateClientsPage> {
  String? location;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final contactController = TextEditingController();
  final cityController = TextEditingController();
  final commentsController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cityController.dispose();
    phoneController.dispose();
    contactController.dispose();
    commentsController.dispose();
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
          "Create Client",
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
                    controller: emailController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: "Email",
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
                    controller: phoneController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      hintText: "Phone Number",
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
                    controller: contactController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.supervised_user_circle,
                        color: Colors.black,
                      ),
                      hintText: "Contact Person",
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
                  onTap: () {},
                  child: LeaveDateItem(
                    dateFrom: location ?? "Location",
                    icon: Icons.location_city,
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
                    controller: cityController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                      hintText: "City",
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
                    controller: commentsController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      hintText: "Comments",
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
