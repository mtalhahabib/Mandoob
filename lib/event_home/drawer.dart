import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/controllers/drawerController.dart';
class DrawerData extends StatelessWidget {
   DrawerData({super.key});
final drawerController=Get.put(DrawerViewModel());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          height: 170,
          width: 250,
          child: Image.asset('assets/white.png'),
        
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 1,
            color:Colors.brown
          ),

        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Obx(() => Card(
            color: drawerController.isAttendee.value? Colors.white:Colors.transparent,
            elevation: 5,
            
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                
              ),
              child: TextButton(
                onPressed: () {drawerController.attendeeRole();},
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                     Icon(Icons.person, color: drawerController.isAttendee.value ? Colors.brown:Colors.white),
                    const SizedBox(width: 10),
                    Text('Attendee', style: TextStyle(color: drawerController.isAttendee.value ? Colors.brown:Colors.white, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),)
          

        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: 
          Obx(() => Card(
            color: drawerController.isAttendee.value? Colors.transparent:Colors.white,
            
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                
              // border: Border.all(color: Colors.brown),
              ),
              child: TextButton(
                onPressed: () {drawerController.organizerRole();},
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Icon(Icons.manage_accounts, color:drawerController.isAttendee.value ? Colors.white:Colors.brown),
                    const SizedBox(width: 10),
                    Text('Organizer', style: TextStyle(color: drawerController.isAttendee.value ? Colors.white:Colors.brown, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
)
        ),
      ]),
    );
  }
}