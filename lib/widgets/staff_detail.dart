import 'package:flutter/material.dart';
import '../models/staff.dart';
import '../screens/staff_create_screen.dart';
import '../widgets/widget.dart';

class StaffDetail extends StatelessWidget {
  final staff;

  const StaffDetail({
    Key? key,
    required this.staff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                builderSizedbox(0.0, 30.0),
                CircleAvatar(
                    radius: 40,
                    child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.cover,
                    )),
                _buildPopupList(context,staff),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildText(staff.name, Colors.black, 16.0, FontWeight.normal),
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 10.0,
                )
              ],
            ),
            buildText(staff.idCard, Colors.black, 12.0, FontWeight.normal),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildText("Role", Colors.grey, 10.0, FontWeight.normal),
                    buildText(
                        staff.role, Colors.black, 14.0, FontWeight.normal),
                    builderSizedbox(20.0, 0.0),
                    buildText(
                        "Phone Number", Colors.grey, 10.0, FontWeight.normal),
                    buildText(staff.phoneNumber, Colors.black, 14.0,
                        FontWeight.normal),
                    builderSizedbox(20.0, 0.0),
                    buildText("Email id", Colors.grey, 10.0, FontWeight.normal),
                    buildText(staff.emailAddress, Colors.black, 14.0,
                        FontWeight.normal),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  _buildPopupList(context,staff) {
    return PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        // add icon, by default "3 dot" icon
        // icon: Icon(Icons.book)
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
              value: 0,
              child: Text("Edit"),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text("Deactivate"),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return StaffForm(
                  staffDet: staff,
                );
              },
            ));
          } else if (value == 1) {
            print("Decativate");
          }
        });
  }
}
