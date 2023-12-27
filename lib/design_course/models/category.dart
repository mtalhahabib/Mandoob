class Category {
  Category(
      {this.title = '',
      this.imagePath = '',
      this.date = '01 Jan',
      this.money = 0,
      this.time = '9 AM',
      this.location = 'Al Burhan'});

  String title;
  String date;
  int money;
  String time;
  String imagePath;
  String location;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'Glory of the Glorious',
      date: '30 Dec',
      money: 15,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'User interface Design',
      date: '30 Dec',
      money: 18,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'User interface Design',
      date: '30 Dec',
      money: 25,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'User interface Design',
      date: '30 Dec',
      money: 18,
      time: '5 PM',
      location: 'Al Burhan',
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'App Design Course',
      date: '30 Dec',
      money: 25,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'Web Design Course',
      date: '30 Dec',
      money: 208,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'App Design Course',
      date: '30 Dec',
      money: 25,
      time: '5 PM',
      location: 'Al Burhan',
    ),
    Category(
      imagePath: 'assets/ncbs.jpg',
      title: 'Web Design Course',
      date: '30 Dec',
      money: 208,
      time: '5 PM',
      location: 'Al Burhan',
    ),
  ];
}
