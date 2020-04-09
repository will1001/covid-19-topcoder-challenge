import 'package:covid19_app/API/NewsAPI.dart';
import 'package:covid19_app/components/HeaderAppBar.dart';
import 'package:covid19_app/components/boxShareIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class DetailNews extends StatefulWidget {
  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  nullCheck(String data) {
    return data == null ? "" : data;
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    NewsAPI data = args.datas;
    timeDilation = 3.0;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Image.network(
                        nullCheck(data.srcimg),
                        height: MediaQuery.of(context).size.height * 0.7,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 21.0, right: 21.0, bottom: 90),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    DateFormat('MMM. yyyy, dd - hh:mm aaa')
                                        .format(
                                            DateTime.parse(nullCheck(data.publishedAt))),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              nullCheck(data.title),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 21),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "   " + nullCheck(data.author),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  //   Text(
                                  //     data.publishedAt,
                                  //     style: TextStyle(
                                  //         color: Colors.white, fontSize: 10),
                                  //   ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  boxShareIcon(context,data),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Text(nullCheck(data.content) +
                        nullCheck(data.content) +
                        nullCheck(data.content) +
                        nullCheck(data.content) +
                        nullCheck(data.content)),
                  ],
                ),
              ),
            ],
          ),
          //NavigationBar
          Container(
            child: HeaderAppBar(
              bgColor: Colors.transparent,
            ),
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 90,
      //   child: Column(
      //     children: <Widget>[
      //       Container(
      //         color: Colors.white.withOpacity(0.4),
      //         width: MediaQuery.of(context).size.width,
      //         height: 30,
      //       ),
      //       Container(
      //         color: Colors.white.withOpacity(0.6),
      //         width: MediaQuery.of(context).size.width,
      //         height: 30,
      //       ),
      //       Container(
      //         color: Colors.white.withOpacity(0.85),
      //         width: MediaQuery.of(context).size.width,
      //         height: 30,
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class ScreenArguments {
  final NewsAPI datas;

  ScreenArguments(this.datas);
}
