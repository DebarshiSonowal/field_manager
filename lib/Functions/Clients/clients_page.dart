import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Models/client.dart';
import '../../Navigation/navigation.dart';
import '../../Router/routes.dart';

class ClientsPage extends StatelessWidget {
  ClientsPage({Key? key}) : super(key: key);
  var clients = [
    Client(
      id: Random.secure().nextInt(1000000),
      numberOfProjects: Random.secure().nextInt(100),
      compnay: "Software Samadhan",
      pointOfContact: "Abhinav Chopra",
    ),
    Client(
      id: Random.secure().nextInt(1000000),
      numberOfProjects: Random.secure().nextInt(100),
      compnay: "Google",
      pointOfContact: "Sundar Pichai",
    ),
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
          "Clients",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 2.h,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var item = clients[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 2.h,
                ),
                decoration: const BoxDecoration(
                  color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.compnay??"",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${item.id}",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 0.05.h,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.pointOfContact??"",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${item.numberOfProjects}",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 1.h,
            );
          },
          itemCount: clients.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigation.instance.navigate(Routes.createClientsPage);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
