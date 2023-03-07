import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'staff_list.dart';

class TabSection extends StatelessWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              radius: 25.0,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedBackgroundColor: Colors.grey[300],
              unselectedLabelStyle: const TextStyle(color: Colors.black),
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "All Staffs",
                ),
                Tab(
                  text: "Active Staffs",
                ),
                Tab(
                  text: "Inactive Staffs",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  StaffListView(),
                  StaffListView(),
                  StaffListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
