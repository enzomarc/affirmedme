import 'package:flutter/foundation.dart';
import 'package:kronosme/core/models/podcast.dart';
import 'package:kronosme/services/podcast_service.dart';

class PodcastProvider extends ChangeNotifier {
  List<Podcast> podcasts = [];
  List<String> categories = [];

  getPodcasts() {
    podcastService.getPodcasts().then((value) {
      podcasts = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });

    podcastService.getCategories().then((value) {
      categories = value;
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }
}
