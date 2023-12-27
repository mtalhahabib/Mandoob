import 'package:flutter/material.dart';

class EventNotes extends StatelessWidget {

  EventNotes({Key? key, required this.image,required this.notes,required this.title}) : super(key: key);

  final String? image;
  final String? notes;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
    
        title:  Row(
          children: [
            Expanded(child: SizedBox()),
            Text(
              'تحریر',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Colors.brown,
                  fontFamily: 'regular',
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.cover,
                ),
              ),
            
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
               title!,
            textAlign: TextAlign.left,
            softWrap: true,
                style: TextStyle(
                    color: Colors.brown,
                    
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Text(
              notes!,
          
              style: TextStyle(
                  color: Colors.black,
                  //fontFamily: 'irregular',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
              ,softWrap: true
               ,)),
               SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
