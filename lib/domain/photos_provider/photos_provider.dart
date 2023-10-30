import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_api_class2/data/repositories/api_services.dart';

import '../../data/Models/PhotosModel.dart';
import 'package:http/http.dart' as http;

class PhotosProvider with ChangeNotifier {
  List<PhotosModel> photosList = [];

  Future<List<PhotosModel>> getPhotos() async {
    final response = await http.get(Uri.parse(AppUrl.appUri));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        photosList.add(PhotosModel.fromJson(i));
      }
      return photosList;
    } else {
      return photosList;
    }
    notifyListeners();
  }
}
