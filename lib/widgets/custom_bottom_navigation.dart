import 'package:field_manager/Navigation/navigation.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Repository/Repository.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Repository>(builder: (context, data, _) {
      return BottomNavigationBar(
        onTap: (val) {
          if (Provider.of<Repository>(context, listen: false).index != val) {
            switch (val) {
              case 1:
                Provider.of<Repository>(context, listen: false)
                    .updateIndex(val);
                Navigation.instance.navigate(Routes.attendancePage);
                break;
              case 2:
                Provider.of<Repository>(context, listen: false)
                    .updateIndex(val);
                Navigation.instance.navigate(Routes.leavePage);
                break;
              case 3:
                Provider.of<Repository>(context, listen: false)
                    .updateIndex(val);
                Navigation.instance.navigate(Routes.morePage);
                break;
              default:
                Provider.of<Repository>(context, listen: false)
                    .updateIndex(val);
                Navigation.instance.navigate(Routes.dashboardPage);
                break;
            }
          }
        },
        currentIndex: data.index,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black45,
        selectedIconTheme: IconThemeData(
          size: 23.sp,
        ),
        unselectedIconTheme: IconThemeData(
          size: 16.sp,
        ),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black45,
              fontSize: 10.sp,
            ),
        selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.indigoAccent,
              fontSize: 12.sp,
            ),
        items: const [
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Attendance",
            icon: Icon(
              Icons.calendar_month,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Leave",
            icon: Icon(
              Icons.watch_later,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "More",
            icon: Icon(
              Icons.more,
              color: Colors.black,
            ),
          ),
        ],
      );
    });
  }
}
