import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kronosme/core/models/podcast.dart';
import 'package:kronosme/core/networker.dart';

class PodcastService {
  List<Podcast> podcasts = [];
  List<String> categories = [];

  Future<List<Podcast>> getPodcasts() async {
    try {
      Response response = await worker.get("/audios");

      if (response.statusCode != 200)
        return podcasts;
      else {
        List data = response.data as List;
        podcasts =
            List<Podcast>.from(data.map((json) => Podcast.fromJson(json)));

        return podcasts;
      }
    } on DioError catch (e) {
      print(e);
      return podcasts;
    }
  }

  Future<List<String>> getCategories() async {
    try {
      Response response = await worker.get("/audios/categories");

      if (response.statusCode != 200)
        return categories;
      else {
        categories = (response.data as List).map((e) => e.toString()).toList();

        return categories;
      }
    } on DioError catch (e) {
      print(e);
      return categories;
    }
  }
}

PodcastService podcastService = PodcastService();
