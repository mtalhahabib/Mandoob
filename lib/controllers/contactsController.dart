import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:googleapis/vision/v1.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';

class ContactsViewModel extends GetxController {
  RxString image = ''.obs;
  RxBool isloading = false.obs;
  RxBool isPicSelected = false.obs;
  void picUploaded() {
    isPicSelected.value = true;
  }

  void notUploaded() {
    isPicSelected.value = false;
  }

  void uploadImage(String path) {
    image.value = path;
  }

//----------------------------------------------------------

//-----------------------------------------------------------
  Future<ServiceAccountCredentials> get _credentials async {
    String _file = await rootBundle.loadString('assets/key.json');
    return ServiceAccountCredentials.fromJson(_file);
  }

  Future<AutoRefreshingAuthClient> get _client async {
    AutoRefreshingAuthClient _client = await clientViaServiceAccount(
        await _credentials, [VisionApi.cloudVisionScope]).then((c) => c);
    return _client;
  }
//............................................................

  Future<List<List<String?>>> search(String assetImagePath) async {
    try {
      File imageFile = File(assetImagePath);
      List<int> bytes = await imageFile.readAsBytes();

      // Convert bytes to base64
      String base64Image = base64Encode(bytes);

      // Convert bytes to base64

      // Vision API call
      var _vision = VisionApi(await _client);
      var _api = _vision.images;
      var _response = await _api.annotate(BatchAnnotateImagesRequest.fromJson({
        "requests": [
          {
            "image": {
              "content": base64Image,
            },
            "features": [
              {"type": "DOCUMENT_TEXT_DETECTION"}
            ],
          }
        ]
      }));

      // Check if the response is not null and contains a valid result
      if (_response != null &&
          _response.responses != null &&
          _response.responses!.isNotEmpty &&
          _response.responses![0].fullTextAnnotation != null) {
        List<String?> names = [];
        List<String?> numbers = [];

        String? apiResponse = _response.responses![0].fullTextAnnotation!.text;
        List<String> namesList = apiResponse!.split('\n');

        for (var annotation in namesList) {
          String? description = annotation;

          // Check if the description contains alphabets (names)
          if (RegExp(r'[a-zA-Z]').hasMatch(description!)) {
            names.add(description);
          }
          // Check if the description contains numbers (phone numbers)
          else if (RegExp(r'\d').hasMatch(description)) {
            numbers.add(description);
          }
        }
        // if (names.length != numbers.length) {
        //   Get.snackbar('Error', 'Please upload a clear image\nNames and Phone Numbers are not equal\nTry Again with a clear image');
        //   return [];
        // } else {return [names, numbers];}
        return [names, numbers];
      } else {
        print("No valid text found in the image.");

        Get.snackbar('Error', 'No valid text found in the image.');
        return [];
      }
    } catch (e) {
      print("Error during API call: $e");
      Get.snackbar('Error Occured', e.toString());
      return [];
    }
  }
}
