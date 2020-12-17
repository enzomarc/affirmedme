import 'package:kronosme/core/utils/constants.dart';

class Podcast {
  String id;
  String title;
  String category;
  String image;
  String path;

  Podcast({
    this.id,
    this.title,
    this.category,
    this.image,
    this.path,
  });

  Podcast.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    category = json['category'];
    image = json['image'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['category'] = this.category;
    data['image'] = this.image;
    data['path'] = this.path;

    return data;
  }

  String hero() {
    return Constants.host + this.image;
  }

  String audio() {
    return Constants.host + this.path;
  }
}
