class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  String kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/alarm.png',
      titleTxt: 'Glory of the Glorious',
      kacl: '5:30',
      meals: <String>['24 Dec'],
      startColor: '#612802',
      endColor: '#f29c63',
    ),
    MealsListData(
      imagePath: 'assets/alarm.png',
      titleTxt: 'Bazme Rekhta',
      kacl: '5:30',
      meals: <String>['24 Dec'],
      startColor: '#612802',
      endColor: '#f29c63',
    ),
    MealsListData(
      imagePath: 'assets/alarm.png',
      titleTxt: 'Death of Morality',
      kacl: '5:30',
      meals: <String>['24 Dec'],
      startColor: '#612802',
      endColor: '#f29c63',
    ),
    MealsListData(
      imagePath: 'assets/alarm.png',
      titleTxt: 'Add Reminder!',
      kacl: '',
      meals: <String>[],
      startColor: '#612802',
      endColor: '#f29c63',
    ),
  ];
}
