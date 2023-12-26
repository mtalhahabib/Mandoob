import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/controllers/contactsController.dart';
import 'package:web_project/fitness_app/training/extractedContacts.dart';
import '../fitness_app_theme.dart';

class RunningView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  RunningView({Key? key, this.animationController, this.animation})
      : super(key: key);
  final contactsController = Get.put(ContactsViewModel());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Obx(
              () => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 0, bottom: 0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: FitnessAppTheme.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: FitnessAppTheme.grey.withOpacity(0.4),
                                offset: Offset(1.1, 1.1),
                                blurRadius: 10.0),
                          ],
                        ),
                        child: 
                           contactsController.isloading.value
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CircularProgressIndicator(
                                        color: Colors.brown),
                                  ),
                                )
                              : Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        child: SizedBox(
                                            height: 74,
                                            width: 74,
                                            child: contactsController
                                                    .isPicSelected.value
                                                ? Image.file(
                                                    File(
                                                      contactsController
                                                          .image.value,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )
                                                : Icon(
                                                    Icons.upload_file,
                                                    color: Colors.grey,
                                                    size: 50,
                                                  )),
                                      ),
                                    ),
                                    contactsController.isPicSelected.value
                                        ? Row(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  contactsController
                                                      .isloading.value = true;

                                                  //-----------------
                                                  //  Write Extraction Code here
                                                  List<List<String?>> list =
                                                      await contactsController
                                                          .search(
                                                              contactsController
                                                                  .image.value);
                                                  if (list.isNotEmpty) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ExtractedContacts(
                                                                list: list,
                                                              )),
                                                    );
                                                  }

                                                  contactsController
                                                      .isloading.value = false;
                                                      contactsController.image.value='';
                                                      contactsController.isPicSelected.value=false;
                                                },
                                                child: Card(
                                                  color: Colors.brown,
                                                  elevation: 5,
                                                  child: Container(
                                                    height: 50,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                        child: Text(
                                                      'Next',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 05,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 50,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              206,
                                                              205,
                                                              205)),
                                                  child: Center(
                                                      child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  )),
                                                ),
                                              )
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 16,
                                                      right: 16,
                                                      top: 16,
                                                    ),
                                                    child: Text(
                                                      "No Picture Seleted",
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            FitnessAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        letterSpacing: 0.0,
                                                        color: FitnessAppTheme
                                                            .nearlyDarkBlue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                  bottom: 12,
                                                  top: 4,
                                                  right: 16,
                                                ),
                                                child: Text(
                                                  "Upload Pic to Extract \nNames and contact numbers ",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontFamily: FitnessAppTheme
                                                        .fontName,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    letterSpacing: 0.0,
                                                    color: FitnessAppTheme.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
