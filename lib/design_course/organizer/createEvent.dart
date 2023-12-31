import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:web_project/design_course/organizer/takeNotes.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEvent> {
  String title = '';
  String date = '';
  String time = '';
  String location = '';
  String imagePath = '';

  Future<void> _uploadPicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.brown,
        title: Row(
          children: [
            Text(
              'Create Event',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Expanded(child: SizedBox()),
            Text(
              'تخلیق',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'irregular',
                  fontSize: 42,
                  color: Colors.brown),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: 250.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: imagePath.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.upload_file,
                        size: 60.0,
                        color: Colors.grey,
                      ),
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 10,
                color: HexColor('#612802'),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: InkWell(
                      onTap: () {
                        _uploadPicture();
                      },
                      child: Center(
                          child: Text(
                        'Upload Poster',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
                onChanged: (value) {
                  setState(() {
                    date = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Time',
                ),
                onChanged: (value) {
                  setState(() {
                    time = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Card(
                elevation: 10,
                color: HexColor('#612802'),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: InkWell(
                      onTap: () {
                        if (imagePath.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakeNotes(
                                      title: title,
                                      date: date,
                                      time: time,
                                      location: location,
                                      imagePath: imagePath)));
                        } else {
                          Get.snackbar('Sorry', 'Please Upload Poster');
                        }
                      },
                      child: Center(
                          child: Text(
                        'Next',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
