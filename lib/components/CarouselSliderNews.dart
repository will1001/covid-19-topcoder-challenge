import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/components/button.dart';
import 'package:covid19_app/routes/DetailNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carouselSliderNews(BuildContext context) {
  return Card(
    elevation: 9,
    child: Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 8, left: 8, bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Lates News"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: button("Show all"),
                  onTap: () {
                    Navigator.pushNamed(context, '/newsAndUpdate');
                  },
                ),
              )
            ],
          ),
          FutureBuilder<List<NewsAPI>>(
            future: fetchNewsAPI("ID"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider(
                  viewportFraction: 0.88,
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  items: snapshot.data
                      .map((f) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Hero(
                              tag: f.id,
                              child: Material(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/detailNews",
                                        arguments: ScreenArguments(f));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: <Widget>[
                                        ClipRRect(
                                           borderRadius: BorderRadius.circular(28.0),
                                          child: Image.network(
                                            f.srcimg == null ? "" : f.srcimg,
                                            height:
                                                MediaQuery.of(context).size.height,
                                          ),
                                        ),
                                        ClipRRect(
                                           borderRadius: BorderRadius.circular(28.0),
                                          child: Container(
                                            color: Colors.black38,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                          ),
                                        ),
                                        Container(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text(
                                                f.title,
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white70,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })
                      .toList()
                      .getRange(0, 3)
                      .toList(),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    ),
  );
}
