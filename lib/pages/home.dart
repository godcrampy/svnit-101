import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../message.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    _color = Theme.of(context).brightness == Brightness.dark
        ? Color(0xff303030)
        : Colors.white;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff352245),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildTitle(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _buildGrid(context)
        ],
      )),
    );
  }

  Widget _buildCard(BuildContext context, String text, IconData icon) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/' + text.toLowerCase());
        },
        child: Card(
          color: Color(0xfff86942),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width * .35,
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: MediaQuery.of(context).size.width * .07,
                          color: _color),
                    ),
                    Icon(
                      icon,
                      color: _color,
                      size: MediaQuery.of(context).size.width * .12,
                    )
                  ])),
        ));
  }

  Widget _buildGrid(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildCard(context, 'Curriculum', Icons.school),
        SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        _buildUrlCard(context, 'Map', Icons.map,
            "https://www.google.com/maps/@?api=1&map_action=map&center=21.163853,72.784871&zoom=16"),
      ]),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildCard(context, 'Updates', Icons.message),
        SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        _buildCard(context, 'Canteen', Icons.fastfood),
      ]),
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildUrlCard(context, 'Calendar', Icons.event,
            "https://github.com/godcrampy/svnit-101/raw/master/data/academic-calendar.pdf"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.07),
        _buildCard(context, 'Settings', Icons.settings),
      ]),
      SizedBox(
        height: 10,
      )
    ]);
  }

  Widget _buildUrlCard(
      BuildContext context, String text, IconData icon, String url) {
    return GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: Card(
          color: Color(0xfff86942),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width * .35,
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: MediaQuery.of(context).size.width * .07,
                          color: _color),
                    ),
                    Icon(
                      icon,
                      color: _color,
                      size: MediaQuery.of(context).size.width * .12,
                    )
                  ])),
        ));
  }

  Widget _buildTitle(BuildContext context) {
    final _random = new Random();
    return InkWell(
        onLongPress: () {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(messages[_random.nextInt(messages.length)]),
            duration: Duration(seconds: 1),
          ));
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('SVNIT',
              style: TextStyle(
                  fontFamily: 'Oswald', fontSize: 72, color: Colors.white)),
          Text('101',
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 65,
                  color: Color(0xfff86942))),
        ]));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
