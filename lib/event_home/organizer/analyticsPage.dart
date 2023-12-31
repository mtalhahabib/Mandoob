import 'package:flutter/material.dart';
import 'package:web_project/event_home/event_theme.dart';

class AnalyticsPage extends StatefulWidget {
  AnalyticsPage({
    Key? key,
    this.image = '',
    required this.title,
    
    required this.names,
  }) : super(key: key);
  final String? image;
  final String? title;
  
  final List<dynamic> names;

  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.image!,fit: BoxFit.cover,),
          ),
          SizedBox(height: 10,),
          Text(widget.title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('Total Registrations: ${widget.names.length}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                height: 200,
                child: ListView.builder( itemCount: widget.names.length,itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: DesignCourseAppTheme.nearlyBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(widget.names[index]),
                      ),
                    ),
                  );
                },),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
