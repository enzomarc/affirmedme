import 'package:flutter/material.dart';
import 'package:kronosme/core/models/podcast.dart';
import 'package:kronosme/providers/podcast_provider.dart';
import 'package:provider/provider.dart';

class Podcasts extends StatefulWidget {
  @override
  _PodcastsState createState() => _PodcastsState();
}

String selectedCategory = "s";

class _PodcastsState extends State<Podcasts> {
  @override
  Widget build(BuildContext context) {
    final podcastProvider =
        Provider.of<PodcastProvider>(context, listen: false);
    podcastProvider.getPodcasts();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Podcasts',
                style: TextStyle(
                  fontFamily: 'Montserrat Bold',
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 30.00,
                width: MediaQuery.of(context).size.width,
                child: Consumer<PodcastProvider>(
                  builder: (context, value, child) {
                    List<String> categories = value.categories;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: categories[index],
                          selected: selectedCategory.toLowerCase() ==
                              categories[index].toLowerCase(),
                          callback: () {
                            setState(() {
                              selectedCategory = categories[index];
                            });
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Consumer<PodcastProvider>(
                    builder: (context, value, child) {
                      List<Podcast> podcasts = value.podcasts
                          .where((e) => e.category == selectedCategory)
                          .toList();

                      return ListView.builder(
                        itemCount: podcasts.length,
                        itemBuilder: (context, index) {
                          return PodcastWidget(podcast: podcasts[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.category,
    this.selected,
    this.callback,
  }) : super(key: key);

  final String category;
  final bool selected;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 120.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10.0),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 3.0,
        ),
        decoration: BoxDecoration(
          color: selected == true ? Color(0xFFFE0000) : Colors.white,
          border: Border.all(
            color: Color(0xFFFE0000),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          category,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected == true ? Colors.white : Color(0xFFFE0000),
            fontFamily: 'Montserrat Medium',
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }
}

class PodcastWidget extends StatelessWidget {
  const PodcastWidget({
    Key key,
    @required this.podcast,
    this.onTap,
  }) : super(key: key);

  final Podcast podcast;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/podcasts/player', arguments: podcast);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
              color: Colors.grey.withOpacity(0.6),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(podcast.hero()),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.30),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(
            left: 10.0,
            bottom: 30.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                podcast.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontFamily: 'Montserrat Semibold',
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {
                  print(
                      "${podcast.title} being played in category ${podcast.category}.");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
