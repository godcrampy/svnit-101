import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../message.dart';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State {
  bool _isTab;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _color = Colors.white;
  @override
  Widget build(BuildContext context) {
    _isTab = MediaQuery.of(context).size.width > 480 ? true : false;
    _color = Theme.of(context).brightness == Brightness.dark
        ? Color(0xff303030)
        : Colors.white;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff352245),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(height: _isTab ? 36 : 24),
        _buildTitle(context),
        SizedBox(height: _isTab ? 36 : 24),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          child: _buildGrid(context),
          width: _isTab ? 450 : 300,
          height: _isTab ? 660 : 440,
        ),
      ],
    ));
  }

  Widget _buildTitle(BuildContext context) {
    final _random = Random();
    return GestureDetector(
        onLongPress: () {
          _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(messages[_random.nextInt(messages.length)]),
              duration: Duration(seconds: 1)));
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('SVNIT',
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: _isTab ? 100 : 72,
                  color: Colors.white)),
          Text('101',
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: _isTab ? 92 : 65,
                  color: Color(0xfff86942))),
        ]));
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.symmetric(horizontal: 20),
      childAspectRatio: 1.00,
      shrinkWrap: true,
      mainAxisSpacing: _isTab ? 30 : 20.0,
      crossAxisSpacing: _isTab ? 30 : 20.0,
      crossAxisCount: 2,
      children: _getCards(),
    );
  }

  List<Widget> _getCards() {
    return [
      _buildCard(context, 'Curriculum', Icons.school),
      _buildUrlCard(context, 'Map', Icons.map,
          "https://www.google.com/maps/@?api=1&map_action=map&center=21.163853,72.784871&zoom=16"),
      _buildCard(context, 'Updates', Icons.message),
      _buildCard(context, 'Canteen', Icons.fastfood),
      _buildUrlCard(context, 'Calendar', Icons.event,
          "https://github.com/godcrampy/svnit-101/raw/master/data/academic-calendar.pdf"),
      _buildCard(context, 'Settings', Icons.settings),
    ];
  }

  Widget _buildCard(BuildContext context, String text, IconData icon) {
    return InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          Navigator.pushNamed(context, '/' + text.toLowerCase());
        },
        splashColor: Colors.deepOrange,
        child: Card(
          elevation: 15,
          color: Color(0xfff86942),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              height: _isTab ? 180 : 120,
              width: _isTab ? 180 : 120,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: _isTab ? 27 : 22,
                          color: _color),
                    ),
                    Icon(
                      icon,
                      color: _color,
                      size: _isTab ? 40 : 36,
                    )
                  ])),
        ));
  }

  Widget _buildUrlCard(
      BuildContext context, String text, IconData icon, String url) {
    return InkWell(
        onTap: () {
          _launchURL(url);
        },
        splashColor: Colors.deepOrange,
        borderRadius: BorderRadius.circular(4),
        child: Card(
          elevation: 15,
          color: Color(0xfff86942),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
              padding: EdgeInsets.all(10),
              height: _isTab ? 180 : 120,
              width: _isTab ? 180 : 120,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: _isTab ? 27 : 22,
                          color: _color),
                    ),
                    Icon(
                      icon,
                      color: _color,
                      size: _isTab ? 40 : 36,
                    )
                  ])),
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void firebaseCloudMessagingListeners() {
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }
}
