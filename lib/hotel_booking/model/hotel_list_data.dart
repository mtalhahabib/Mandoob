class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.location='NUST',
    this.reviews = 80,
    this.rating = 4.5,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  String location;
  double rating;
  int reviews;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/quds.jpg',
      titleTxt: 'Mufti Syed Adnan Kakakhel',
      subTxt: '5 Dec - 10 Am',
      location: 'SEECS',
      reviews: 80,
      rating: 4.4,
    ),
    HotelListData(
      imagePath: 'assets/ustad.jpg',
      titleTxt: 'Ustad Daniyal Malik',
      subTxt: 'Wembley, London',
      location: 'SEECS',
      reviews: 74,
      rating: 4.5,
    ),
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
