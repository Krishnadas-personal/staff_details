import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:staff_app/models/staff.dart';
import 'package:staff_app/widgets/widget.dart';

class StaffForm extends StatefulWidget {
  final staffDet;
  StaffForm({required this.staffDet});

  @override
  State<StaffForm> createState() => _StaffFormState();
}

class _StaffFormState extends State<StaffForm> {
  final _staffNameController = TextEditingController();
  final _idNoController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _userRoleController = TextEditingController();
  File? imageFile;
  @override
  void initState() {
    if (widget.staffDet != null) {
      _staffNameController.text = widget.staffDet.name;
      _idNoController.text = widget.staffDet.idCard;
      _phoneNumberController.text = widget.staffDet.phoneNumber;
      _emailAddressController.text = widget.staffDet.emailAddress;
      _userRoleController.text = widget.staffDet.role;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      icon: const Icon(Icons.keyboard_arrow_left_outlined)),
                  builderSizedbox(0.0, 35.0),
                  if (widget.staffDet == null)
                    buildText(
                        "Create Staff", Colors.black, 20.0, FontWeight.bold),
                ],
              ),
              Center(
                child: Stack(children: [
                  CircleAvatar(
                    backgroundImage:(imageFile == null)
                          ? Image.asset(
                              'assets/user.png',
                              fit: BoxFit.cover,
                            ).image
                          : Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ).image,
                      radius: 45,
                    ),
                  Positioned(
                      bottom: 0,
                      right: -15,
                      child: IconButton(
                        onPressed: (() {
                          _getFromGallery();
                        }),
                        icon: Icon(Icons.camera_alt),
                      ))
                ]),
              ),
              builderSizedbox(10.0, 0.0),
              buildText("Name", Colors.grey, 14.0, FontWeight.normal),
              _buildTextField("Enter Staff name", _staffNameController),
              builderSizedbox(10.0, 0.0),
              buildText("ID Num", Colors.grey, 14.0, FontWeight.normal),
              _buildTextField("Enter Staff ID Number", _idNoController),
              builderSizedbox(10.0, 0.0),
              buildText("Phone Number", Colors.grey, 14.0, FontWeight.normal),
              _buildTextField("Enter Mobile Number", _phoneNumberController),
              builderSizedbox(10.0, 0.0),
              buildText("Email Address", Colors.grey, 14.0, FontWeight.normal),
              _buildTextField(
                  "Enter Staff Email Address", _emailAddressController),
              builderSizedbox(10.0, 0.0),
              buildText("User Role", Colors.grey, 14.0, FontWeight.normal),
              _buildTextField("Enter Staff Role", _userRoleController),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: (widget.staffDet == null)
                        ? buildText("Add", Colors.white, 20.0, FontWeight.bold)
                        : buildText(
                            "Save", Colors.white, 20.0, FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        
      imageFile = File(pickedFile.path);
      });
    }
  }

  _buildTextField(label, _controller) {
    return Container(
      height: 50,
      child: TextField(
        controller: _controller,

        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        // onSubmitted: (_) => addtrans(),
      ),
    );
  }
}
