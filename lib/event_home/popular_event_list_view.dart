import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_project/controllers/drawerController.dart';
import 'package:web_project/database/retrieveEventData.dart';
import 'package:web_project/event_home/event_detail_screen.dart';
import 'package:web_project/event_home/event_theme.dart';
import 'package:web_project/event_home/models/category.dart';
import 'package:web_project/event_home/organizer/analyticsPage.dart';

class PopularEventListView extends StatefulWidget {
  const PopularEventListView({
    Key? key,
  }) : super(key: key);

  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularEventListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    super.initState();
  }

  final drawerController = Get.put(DrawerViewModel());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: drawerController.isAttendee.value
          ? StreamBuilder<QuerySnapshot>(
              stream: RetrieveEvents().retrieveEventData(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No Data to Display'),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  );
                } else if (snapshot.hasData) {
                  final eventList = snapshot.data!.docs;
                  return ListView(
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                      eventList.length,
                      (int index) {
                        final int count = Category.popularCourseList.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animationController!,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn),
                          ),
                        );
                        animationController?.forward();
                        final eventMap =
                            eventList[index].data() as Map<String, dynamic>;

                        return CategoryView(
                          eventMap: eventMap,
                          animation: animation,
                          animationController: animationController,
                        );
                      },
                    ),
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 1,
                    //   mainAxisSpacing: 32.0,
                    //   crossAxisSpacing: 32.0,
                    //   childAspectRatio: 0.8,
                    // ),
                  );
                } else {
                  return Center(
                    child: Text('-------'),
                  );
                }
              },
            )
          : StreamBuilder<QuerySnapshot>(
              stream: RetrieveEvents().retrieveEventData(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No Data to Display'),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  );
                } else if (snapshot.hasData) {
                  final eventList = snapshot.data!.docs;
                  return ListView(
                    padding: const EdgeInsets.all(8),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(
                      eventList.length,
                      (int index) {
                        final int count = Category.popularCourseList.length;
                        final Animation<double> animation =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animationController!,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn),
                          ),
                        );
                        animationController?.forward();
                        final eventMap =
                            eventList[index].data() as Map<String, dynamic>;
                        if (eventMap['OrganizerID'] ==
                            FirebaseAuth.instance.currentUser!.uid) {
                          return CategoryView(
                            eventMap: eventMap,
                            animation: animation,
                            animationController: animationController,
                          );
                        }else{
                          return Container();
                        }
                      },
                    ),
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 1,
                    //   mainAxisSpacing: 32.0,
                    //   crossAxisSpacing: 32.0,
                    //   childAspectRatio: 0.8,
                    // ),
                  );
                } else {
                  return Center(
                    child: Text('-------'),
                  );
                }
              },
            ),
    );
  }
}

class CategoryView extends StatelessWidget {
  CategoryView({
    Key? key,
    required this.eventMap,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final Map<String, dynamic> eventMap;
  final AnimationController? animationController;
  final Animation<double>? animation;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  final drawerController = Get.put(DrawerViewModel());
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                drawerController.isAttendee.value
                    ? Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => EventInfoScreen(
                            image: eventMap['imagePath'],
                            title: eventMap['title'],
                            date: eventMap['date'],
                            time: eventMap['time'],
                            location: eventMap['location'],
                            eventId: eventMap['eventId'],
                            uid: userId,
                            money: 0,
                          ),
                        ),
                      )
                    : Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => AnalyticsPage(
                            image: eventMap['imagePath'],
                            names:eventMap['registrations'],
                            title: eventMap['title'],
                          ),
                        ),
                      );
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 0, left: 0),
                  child: Column(
                    children: [
                      Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color:
                                    DesignCourseAppTheme.grey.withOpacity(0.2),
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 6.0),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0)),
                                child: Image.network(
                                  eventMap['imagePath'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0)),
                                  color: HexColor('#F8FAFB'),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${eventMap['title']}",
                                        style: TextStyle(
                                            color: HexColor('#2D2D2D'),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${eventMap['date']}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.alarm,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${eventMap['time']}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.location_searching,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${eventMap['location']}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
