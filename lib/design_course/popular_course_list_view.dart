import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_project/design_course/course_info_screen.dart';
import 'package:web_project/design_course/design_course_app_theme.dart';
import 'package:web_project/design_course/models/category.dart';

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView({Key? key, }) : super(key: key);

  
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return ListView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                Category.popularCourseList.length,
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
                  return CategoryView(
                    
                    category: Category.popularCourseList[index],
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
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      this.category,
      this.animationController,
      this.animation,
      })
      : super(key: key);

  
  final Category? category;
  final AnimationController? animationController;
  final Animation<double>? animation;

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
              onTap: (){
                 Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(
          image: category!.imagePath,
          title: category!.title,
          date: category!.date,
          time: category!.time,
          location: category!.location,
          money: category!.money,

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
                                child: Image.asset(
                                  category!.imagePath,
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
                                        category!.title,
                                        style: TextStyle(
                                            color: HexColor('#2D2D2D'),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Icon(Icons.calendar_month,color: Colors.grey,),
                                          Text(
                                            "${category!.date}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                           Icon(Icons.alarm,color: Colors.grey,),
                                          Text(
                                            "${category!.time}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ), Icon(Icons.location_searching,color: Colors.grey,),
                                          Text(
                                            "${category!.location}",
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
