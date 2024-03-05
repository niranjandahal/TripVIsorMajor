import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tagprovider extends ChangeNotifier {
  List<String> tags = [
    'Hiking',
    'Adventure Tourism',
    'Trekking Destinations',
    'Mountain Trails',
    'Outdoor Adventure',
    'Nature Exploration',
    'Backpacking Adventures',
    'Wilderness Trekking',
    'Mountain Expeditions',
    'Scenic Routes',
    'Alpine Adventures',
    'Trekking Holidays',
    'Trail Exploration',
    'Expedition Planning',
    'High-altitude Trekking',
    'Nature Discovery',
  ];

//ads images section
  List<String> adsimglist = [
    
  ];

  bool adsimglistloaded = false;

  //selected image section

  List<String> selectedtagimg = [];

  String selectedtags = '';

  String content = '';

  //function to update data
  Color tagcolor(String tag) {
    if (selectedtags == tag) {
      return const Color(0xFF5A5DF7).withOpacity(0.7);
    } else {
      return Colors.white;
    }
  }

  Color tagtextcolor(String tag) {
    if (selectedtags == tag) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  void updatecontent() {
    content = selectedtags;
    notifyListeners();
  }

  void selecttags(String tag) {
    if (selectedtags == tag) {
      selectedtags = '';
      notifyListeners();
    } else {
      selectedtags = tag;
      notifyListeners();
    }
  }

  // https://picsum.photos/v2/list?page=2&limit=10

  Future<void> getadsimg() async {
    //if ads not loaded then load ads
    if (adsimglistloaded == false) {
      var url = Uri.parse('https://picsum.photos/v2/list?page=2&limit=10');
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        adsimglist.add(data[i]['download_url']);
      }
      adsimglistloaded = true;
      notifyListeners();
    }
  }

  Future<void> getselectedtagimg(String tags) async {
    selectedtagimg.clear();
    var url = Uri.parse('https://picsum.photos/v2/list?page=2&limit=10');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      selectedtagimg.add(
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}');
    }
  }
}
