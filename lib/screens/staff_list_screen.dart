import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:staff_app/provider/staff_provider.dart';

import '../widgets/drawer.dart';
import '../widgets/tab_controller.dart';
import '../widgets/widget.dart';
import 'staff_create_screen.dart';

class StaffList extends StatefulWidget {
  const StaffList({Key? key}) : super(key: key);

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  bool _init = true;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<StaffProvider>(context).staffLists().then((_) {
        setState(() {
          _isLoading = false;
        });
        print(_isLoading.toString() + " _isLoading");
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Staff List",
              style: TextStyle(fontSize: 18, color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.black)),
          ]),
      body: (_isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: ((value) {
                      Provider.of<StaffProvider>(context, listen: false)
                          .staffSearch(value);
                    }),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        label: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.search),
                            builderSizedbox(0.0, 10.0),
                            const Text("Search"),
                          ],
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                  builderSizedbox(10.0, 0.0),
                  TabSection(),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return StaffForm(staffDet:null,);
            },
          ));
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
