import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_project/database/createEventDatabase.dart';

class TakeNotes extends StatefulWidget {
  TakeNotes({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String time;
  final String date;
  final String location;

  @override
  State<TakeNotes> createState() => _TakeNotesState();
}

class _TakeNotesState extends State<TakeNotes> {
  TextEditingController controller = TextEditingController();
  String userId = FirebaseAuth.instance.currentUser!.uid;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        foregroundColor: Colors.brown,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Provide Notes',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Row(
              children: [
                Text(
                  'For Audience',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      fontSize: 15),
                ),
                Expanded(child: SizedBox()),
                Text(
                  'تحریر',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'irregular',
                      fontSize: 42,
                      color: Colors.brown),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,

              // Set the width of the container
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLines:
                      null, // Set the maximum number of lines for vertical height
                  maxLength: null, // Set the maximum number of characters
                  controller: controller,
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), focusColor: Colors.brown),

                  cursorColor: Colors.brown,
                  cursorWidth: 2.0,
                  cursorRadius: Radius.circular(5.0),
                  onChanged: (value) {
                    // Callback function when the text changes
                    controller.text = value;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 020,
            ),
            Card(
              elevation: 10,
              color: HexColor('#612802'),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.75,
                child: isloading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.brown,
                      ))
                    : InkWell(
                        onTap: () async {
                          setState(() {
                            isloading = true;
                          });
                          String imageUrl = await Create()
                              .uploadImageAndGetUrl(widget.imagePath);
                          Create().createEvent(
                              userId,
                              widget.title,
                              imageUrl,
                              widget.date,
                              widget.time,
                              widget.location,
                              controller.text);
                          Navigator.pop(context);

                          Navigator.pop(context);
                          setState(() {
                            isloading = false;
                          });
                        },
                        child: Center(
                            child: Text(
                          'Done',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
