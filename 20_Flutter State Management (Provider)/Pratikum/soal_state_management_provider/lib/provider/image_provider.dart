import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImgProvider extends ChangeNotifier {
  List<String> _images = [
    'https://images.pexels.com/photos/8920380/pexels-photo-8920380.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15917105/pexels-photo-15917105.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
    'https://images.pexels.com/photos/4051642/pexels-photo-4051642.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/11172081/pexels-photo-11172081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15780778/pexels-photo-15780778.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/10800492/pexels-photo-10800492.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/15655688/pexels-photo-15655688.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/10603697/pexels-photo-10603697.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];

  List<String> getImages() => _images;

  void addImage(String url) {
    _images.add(url);
    notifyListeners();
  }
}
