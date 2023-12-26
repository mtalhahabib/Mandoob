import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_project/design_course/category_list_view.dart';
import 'package:web_project/design_course/course_info_screen.dart';
import 'package:web_project/design_course/drawer.dart';
import 'package:web_project/design_course/popular_course_list_view.dart';
import 'design_course_app_theme.dart';

class DesignCourseHomeScreen extends StatefulWidget {
  @override
  _DesignCourseHomeScreenState createState() => _DesignCourseHomeScreenState();
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
  
  

  final ScrollController _scrollController = ScrollController();

  CategoryType categoryType = CategoryType.all;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 199, 156, 140),
          child:DrawerData(),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: <Widget>[
                              // getSearchBarUI(),
                              getCategoryUI(),

                            ],
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ];
                },
                body: getPopularCourseUI(),
                // child: Container(
                //   height: MediaQuery.of(context).size.height,
                //   child: Column(
                //     children: <Widget>[
                //       // getSearchBarUI(),
                //       getCategoryUI(),
                //       Flexible(
                //         child: getPopularCourseUI(),
                //       ),
                //       SizedBox(
                //         height: 100,
                //       )
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18, right: 16),
          child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                getButtonUI(CategoryType.all, categoryType == CategoryType.all),
                const SizedBox(
                  width: 10,
                ),
                getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
                const SizedBox(
                  width: 10,
                ),
                getButtonUI(
                    CategoryType.coding, categoryType == CategoryType.coding),
                const SizedBox(
                  width: 10,
                ),
                getButtonUI(
                    CategoryType.basic, categoryType == CategoryType.basic),
                const SizedBox(
                  width: 10,
                ),
                getButtonUI(
                    CategoryType.drive, categoryType == CategoryType.drive),
                const SizedBox(
                  width: 10,
                ),
                getButtonUI(CategoryType.entertainment,
                    categoryType == CategoryType.entertainment),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular Events',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.all == categoryTypeData) {
      txt = 'All';
    } else if (CategoryType.ui == categoryTypeData) {
      txt = 'Speakers';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Religious';
    } else if (CategoryType.drive == categoryTypeData) {
      txt = 'Drives';
    } else if (CategoryType.entertainment == categoryTypeData) {
      txt = 'Chill';
    }
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: isSelected
              ? DesignCourseAppTheme.nearlyBlue
              : DesignCourseAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          onTap: () {
            setState(() {
              categoryType = categoryTypeData;
            });
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  letterSpacing: 0.27,
                  color: isSelected
                      ? DesignCourseAppTheme.nearlyWhite
                      : DesignCourseAppTheme.nearlyBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: DesignCourseAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 18),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => {scaffoldKey.currentState?.openDrawer()},
            icon: Icon(Icons.menu),
            color: Colors.brown,
            iconSize: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      'Talha',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 0.27,
                        color: DesignCourseAppTheme.darkerText,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '! السلام عليكم',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'irregular',
                        fontSize: 32,
                        letterSpacing: 0.27,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Let's find an Event ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: ClipOval(
              child: Image.asset(
                'assets/prof.png',
                width: 50,
                height: 50,
                fit: BoxFit
                    .cover, // This ensures the image covers the circular area
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum CategoryType {
  all,
  ui,
  coding,
  basic,
  drive,
  entertainment,
}
