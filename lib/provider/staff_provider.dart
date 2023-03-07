import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/staff.dart';

class StaffProvider with ChangeNotifier {
  List<Staff> _staffList = [];
  List<Staff> _staffList_search = [];

  List<Staff> get staffList {
    return [..._staffList];
  }

  Future<void> staffLists() async {
    const url =
        'http://m8itsolutions.in/mobilestaticapp/events/exhibitor/staff_list.json';

    try {
      final response = await http.get(Uri.parse(url));
      final addStaff = json.decode(response.body);
      final staffData = addStaff['data']['results'];
      List<Staff> loadedStaff = [];
      for (var dataJson in staffData) {
        loadedStaff.add(Staff.fromJson(dataJson));
      }
      _staffList = loadedStaff;
      _staffList_search = loadedStaff;
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  void staffSearch(userText) {
    userText = userText.toUpperCase();

    _staffList = _staffList_search.where((data) {
      var search = data.name.toString().toUpperCase();
      return search.contains(userText);
    }).toList();
    notifyListeners();
  }

  List<Staff> staffById(id) {
    return _staffList.where((element) {
      return element.id == id;
    }).toList();
   notifyListeners();
  }
}
