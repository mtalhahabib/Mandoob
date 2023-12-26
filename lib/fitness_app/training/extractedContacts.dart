
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
class ExtractedContacts extends StatefulWidget {
  
  List<List<String?>> list;
  ExtractedContacts({Key? key, required this.list}) : super(key: key);

  @override
  State<ExtractedContacts> createState() => _ExtractedContactsState();
}

class _ExtractedContactsState extends State<ExtractedContacts> {
Future<void> saveToPhone(list) async {
    if (await FlutterContacts.requestPermission()) {
      for (int i = 0; i < list[0].length; i++) {
        final newContact = Contact()
          ..name.first = list[0][i]
          ..phones = [Phone(list[1][i])];
        await newContact.insert();
      }
      print('Done with it');
    }
  }

  String newValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckList',style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold),),
          actions: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                              'Are you sure you want to Save the Cantacts !!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.grey),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.brown),
                                onPressed: () {
                                  saveToPhone(widget.list);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        );
                      });
                },
                child: Card(
                  elevation: 5,
                  color: Colors.brown,
                  child: Container(
                    height: 70,
                    width: 80,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                    ),
                  
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Prefix',
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),
            ),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Insert Prefix"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration:
                              InputDecoration(hintText: "Add Prefix to Name"),
                          onChanged: (value) {
                            setState(() {
                              newValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            for (int i = 0; i < widget.list[0].length; i++) {
                              widget.list[0][i] =
                                  newValue + ' ' + widget.list[0][i]!;
                            }
                            setState(() {});
                            Navigator.pop(context);
                          },
                          child: Text("Save")),
                    ],
                  );
                });
          },
        ),
        body: ListView.builder(
          itemCount: widget.list[0].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                    title: Text(widget.list[0][index]!),
                    subtitle: Text(widget.list[1][index]!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Contact"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: TextEditingController(
                                              text: widget.list[0][index]),
                                          decoration: InputDecoration(
                                              hintText: "Enter Name"),
                                          onChanged: (value) {
                                            setState(() {
                                              widget.list[0][index] = value;
                                            });
                                          },
                                        ),
                                        TextField(
                                          controller: TextEditingController(
                                              text: widget.list[1][index]),
                                          decoration: InputDecoration(
                                              hintText: "Enter Number"),
                                          onChanged: (value) {
                                            setState(() {
                                              widget.list[1][index] = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Save")),
                                    ],
                                  );
                                });
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.list[0].removeAt(index);
                              widget.list[1].removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    )),
              ),
            );
          },
        ));
  }
}