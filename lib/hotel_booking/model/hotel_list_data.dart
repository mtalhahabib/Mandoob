class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.location = 'NUST',
    this.reviews = 80,
    this.rating = 4.5,
    this.notes = "",
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String location;
  double rating;
  int reviews;
  String notes;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
        imagePath: 'assets/quds.jpg',
        titleTxt: 'Mufti Syed Adnan Kakakhel',
        subTxt: '5 Dec - 10 Am',
        location: 'SEECS',
        reviews: 80,
        rating: 4.4,
        notes:
            'ان عدة الشهور عند الله اثنا عشر شهرا في كتاب الله يوم خلق السماوات والارض منها اربعة حرم ذلك الدين القيم فلاتظلموا فيهن انفسكم وقاتلوا المشركين كافة كما ...'),
    HotelListData(
        imagePath: 'assets/ustad.jpg',
        titleTxt: 'Ustad Daniyal Malik',
        subTxt: 'Wembley, London',
        location: 'SEECS',
        reviews: 74,
        rating: 4.5,
        notes: '''What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'''),
    HotelListData(
      imagePath: 'assets/quds.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      location: 'SEECS',
      reviews: 62,
      rating: 4.0,
    ),
    HotelListData(
      imagePath: 'assets/ustad.jpg',
      titleTxt: 'Queen Hotel',
      subTxt: 'Wembley, London',
      location: 'SEECS',
      reviews: 90,
      rating: 4.4,
    ),
    HotelListData(
      imagePath: 'assets/ustad.jpg',
      titleTxt: 'Grand Royal Hotel',
      subTxt: 'Wembley, London',
      location: 'SEECS',
      reviews: 240,
      rating: 4.5,
    ),
  ];
}
