import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staff_app/provider/staff_provider.dart';

import 'staff_detail.dart';

class StaffListView extends StatefulWidget {
  const StaffListView({Key? key}) : super(key: key);

  @override
  State<StaffListView> createState() => _StaffListViewState();
}

class _StaffListViewState extends State<StaffListView> {
  @override
  Widget build(BuildContext context) {
    final staff = Provider.of<StaffProvider>(context).staffList;
    return ListView.builder(
        itemCount: staff.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Flexible(
                  flex: 2,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.all(10),
                      child: Text(staff[index].role),
                    ),
                  )),
              Flexible(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.cover,
                    )),
                    title: Row(
                      children: [
                        Text(staff[index].name),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      ],
                    ),
                    subtitle: Text(staff[index].idCard),
                    onTap: () {
                      staffDetailSheet(
                          context,
                         staff[index]);
                    },
                  ),
                ),
              )
            ],
          );
        });
  }

  void staffDetailSheet(BuildContext context, staff) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        context: context,
        builder: (btx) {
          return StaffDetail(
            staff:staff
          );
        });
  }
}
