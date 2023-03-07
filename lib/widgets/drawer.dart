import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.0),
              topRight: Radius.circular(35.0))),
      child: Column(
        children: [
          // AppBar(

          //   title: const Text("Hello Friends "),
          //   automaticallyImplyLeading: false,
          // ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/drawer_image.png', scale: 2.0),
          ),

          _builderListView(Icons.home, "Home", context),

          _builderListView(Icons.padding, "Exhibitors List", context),
          _builderListView(Icons.trending_up, "Reports", context),
          _builderListView(Icons.settings, "Settings", context),
          _builderListView(Icons.logout, "Log Out", context),
        ],
      ),
    );
  }

  Widget _builderListView(icon, title, context) {
    return ListTileTheme(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
    );
  }
}
