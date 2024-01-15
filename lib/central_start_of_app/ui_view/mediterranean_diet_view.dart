import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:web_project/database/retrieveEventData.dart';
import 'dart:math' as math;

import 'package:web_project/main.dart';
import 'package:web_project/central_start_of_app/central_app_theme.dart';

class MediterranesnDietView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  MediterranesnDietView({Key? key, this.animationController, this.animation})
      : super(key: key);

  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: RetrieveEvents().retrieveMyEvents(userId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No Data to Display'),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
              ),
            );
          } else if (snapshot.hasData) {
            final eventList = snapshot.data!.docs;

            
            return Container(
              height: 330,
              
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: eventList.length,
                  itemBuilder: (context, index) {
                    final eventMap = eventList[index].data() as Map<String, dynamic>;
                   return Container(
                    width: MediaQuery.of(context).size.width*1,
                     child: AnimatedBuilder(
                       animation: animationController!,
                       builder: (BuildContext context, Widget? child) {
                         return FadeTransition(
                           opacity: animation!,
                           child: new Transform(
                             transform: new Matrix4.translationValues(
                                 0.0, 30 * (1.0 - animation!.value), 0.0),
                             child: Padding(
                               padding: const EdgeInsets.only(
                                   left: 24, right: 24, top: 16, bottom: 18),
                               child: Container(
                                 width: 200,
                                 decoration: BoxDecoration(
                                   color: AppTheme.white,
                                   borderRadius: BorderRadius.only(
                                       topLeft: Radius.circular(8.0),
                                       bottomLeft: Radius.circular(8.0),
                                       bottomRight: Radius.circular(8.0),
                                       topRight: Radius.circular(68.0)),
                                   boxShadow: <BoxShadow>[
                                     BoxShadow(
                                         color: AppTheme.grey
                                             .withOpacity(0.2),
                                         offset: Offset(1.1, 1.1),
                                         blurRadius: 10.0),
                                   ],
                                 ),
                                 child: Column(
                                   children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           top: 16, left: 16, right: 16),
                                       child: Row(
                                         children: <Widget>[
                                           Padding(
                                               padding: const EdgeInsets.only(
                                                   left: 8, right: 8, top: 4),
                                               child: Container(
                                                 height: 130,
                                                 width: 130,
                                                 decoration: BoxDecoration(
                                                   color: AppTheme
                                                       .nearlyWhite,
                                                   borderRadius:
                                                       BorderRadius.circular(16),
                                                   boxShadow: <BoxShadow>[
                                                     BoxShadow(
                                                         color: AppTheme
                                                             .grey
                                                             .withOpacity(0.1),
                                                         offset:
                                                             Offset(1.1, 1.1),
                                                         blurRadius: 10.0),
                                                   ],
                                                 ),
                                                 child: ClipRRect(
                                                   borderRadius:
                                                       BorderRadius.all(
                                                           Radius.circular(
                                                               16.0)),
                                                   child: Image.network(
                                                     eventMap['imagePath'],
                                                     fit: BoxFit.cover,
                                                   ),
                                                 ),
                                               )),
                                           Padding(
                                             padding: const EdgeInsets.only(
                                                 right: 16),
                                             child: Center(
                                               child: Stack(
                                                 clipBehavior: Clip.none,
                                                 children: <Widget>[
                                                   Padding(
                                                     padding:
                                                         const EdgeInsets.all(
                                                             8.0),
                                                     child: Container(
                                                       width: 100,
                                                       height: 100,
                                                       decoration: BoxDecoration(
                                                         color: AppTheme
                                                             .white,
                                                         borderRadius:
                                                             BorderRadius.all(
                                                           Radius.circular(
                                                               100.0),
                                                         ),
                                                         border: new Border.all(
                                                             width: 4,
                                                             color: AppTheme
                                                                 .nearlyDarkBlue
                                                                 .withOpacity(
                                                                     0.2)),
                                                       ),
                                                       child: Column(
                                                         mainAxisAlignment:
                                                             MainAxisAlignment
                                                                 .center,
                                                         crossAxisAlignment:
                                                             CrossAxisAlignment
                                                                 .center,
                                                         children: <Widget>[
                                                           Text(
                                                             eventMap['time'],
                                                             textAlign: TextAlign
                                                                 .center,
                                                             style: TextStyle(
                                                               fontFamily:
                                                                   AppTheme
                                                                       .fontName,
                                                               fontWeight:
                                                                   FontWeight
                                                                       .normal,
                                                               fontSize: 24,
                                                               letterSpacing:
                                                                   0.0,
                                                               color: AppTheme
                                                                   .nearlyDarkBlue,
                                                             ),
                                                           ),
                                                           Text(
                                                             'Time left',
                                                             textAlign: TextAlign
                                                                 .center,
                                                             style: TextStyle(
                                                               fontFamily:
                                                                   AppTheme
                                                                       .fontName,
                                                               fontWeight:
                                                                   FontWeight
                                                                       .bold,
                                                               fontSize: 12,
                                                               letterSpacing:
                                                                   0.0,
                                                               color: AppTheme
                                                                   .grey
                                                                   .withOpacity(
                                                                       0.5),
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                         const EdgeInsets.all(
                                                             4.0),
                                                     child: CustomPaint(
                                                       painter: CurvePainter(
                                                           colors: [
                                                             AppTheme
                                                                 .nearlyDarkBlue,
                                                             HexColor("#8A98E8"),
                                                             HexColor("#8A98E8")
                                                           ],
                                                           angle: 140 +
                                                               (360 - 140) *
                                                                   (1.0 -
                                                                       animation!
                                                                           .value)),
                                                       child: SizedBox(
                                                         width: 108,
                                                         height: 108,
                                                       ),
                                                     ),
                                                   )
                                                 ],
                                               ),
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           left: 24,
                                           right: 24,
                                           top: 8,
                                           bottom: 8),
                                       child: Container(
                                         height: 40,
                                         decoration: BoxDecoration(
                                           color: AppTheme.background,
                                           borderRadius: BorderRadius.all(
                                               Radius.circular(4.0)),
                                         ),
                                         child: Row(
                                           children: [
                                             Icon(Icons.title,
                                                 color: Colors.grey),
                                             SizedBox(width: 10),
                                             Text(eventMap['title'],
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 20,
                                                     fontFamily: 'Roboto')),
                                           ],
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           left: 24,
                                           right: 24,
                                           top: 8,
                                           bottom: 16),
                                       child: Row(
                                         mainAxisAlignment:
                                             MainAxisAlignment.spaceBetween,
                                         children: <Widget>[
                                           Column(
                                             mainAxisAlignment:
                                                 MainAxisAlignment.center,
                                             crossAxisAlignment:
                                                 CrossAxisAlignment.center,
                                             children: <Widget>[
                                               Text(
                                                 eventMap['location'],
                                                 textAlign: TextAlign.center,
                                                 style: TextStyle(
                                                   fontFamily:
                                                       AppTheme.fontName,
                                                   fontWeight: FontWeight.w500,
                                                   fontSize: 16,
                                                   letterSpacing: -0.2,
                                                   color:
                                                       AppTheme.darkText,
                                                 ),
                                               ),
                                               Padding(
                                                 padding: const EdgeInsets.only(
                                                     top: 6),
                                                 child: Icon(
                                                   Icons.location_on,
                                                   color: AppTheme.grey
                                                       .withOpacity(0.5),
                                                 ),
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment:
                                                 MainAxisAlignment.center,
                                             crossAxisAlignment:
                                                 CrossAxisAlignment.center,
                                             children: <Widget>[
                                               Column(
                                                 mainAxisAlignment:
                                                     MainAxisAlignment.center,
                                                 crossAxisAlignment:
                                                     CrossAxisAlignment.center,
                                                 children: <Widget>[
                                                   Text(
                                                     eventMap['time'],
                                                     textAlign: TextAlign.center,
                                                     style: TextStyle(
                                                       fontFamily:
                                                           AppTheme
                                                               .fontName,
                                                       fontWeight:
                                                           FontWeight.w500,
                                                       fontSize: 16,
                                                       letterSpacing: -0.2,
                                                       color: AppTheme
                                                           .darkText,
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                         const EdgeInsets.only(
                                                             top: 6),
                                                     child: Icon(
                                                       Icons.timer_sharp,
                                                       color: AppTheme
                                                           .grey
                                                           .withOpacity(0.5),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                           Row(
                                             mainAxisAlignment:
                                                 MainAxisAlignment.end,
                                             crossAxisAlignment:
                                                 CrossAxisAlignment.center,
                                             children: <Widget>[
                                               Column(
                                                 mainAxisAlignment:
                                                     MainAxisAlignment.center,
                                                 crossAxisAlignment:
                                                     CrossAxisAlignment.center,
                                                 children: <Widget>[
                                                   Text(
                                                     eventMap['date'],
                                                     style: TextStyle(
                                                       fontFamily:
                                                           AppTheme
                                                               .fontName,
                                                       fontWeight:
                                                           FontWeight.w500,
                                                       fontSize: 16,
                                                       letterSpacing: -0.2,
                                                       color: AppTheme
                                                           .darkText,
                                                     ),
                                                   ),
                                                   Padding(
                                                     padding:
                                                         const EdgeInsets.only(
                                                             top: 6),
                                                     child: Icon(
                                                       Icons
                                                           .calendar_today_outlined,
                                                       color: AppTheme
                                                           .grey
                                                           .withOpacity(0.5),
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           )
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         );
                       },
                     ),
                   );
                  }),
            );
          } else {
            return Center(
              child: Text('-------------'),
            );
          }
        });
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
