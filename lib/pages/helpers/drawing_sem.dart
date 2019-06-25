import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _buildSubjectCard(String name, int credits, IconData icon, String key) {
  return InkWell(
      splashColor: Colors.deepOrange,
      onTap: () {
        _launchURL('https://github.com/godcrampy/svnit-101-serve/raw/master/' +
            key +
            '.pdf');
      },
      child: Card(
          elevation: 7.0,
          margin: EdgeInsets.all(10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(),
                child: Icon(
                  icon,
                  size: 28,
                ),
              ),
              title: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(credits.toString() + " credits",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0))));
}

class DrawingSem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSubjectCard("Mathematics-I ", 4,
            Icons.functions, 'civil'),
        _buildSubjectCard(
            "Engineering Mathematics", 4, Icons.all_inclusive, 'maths'),
        _buildSubjectCard(
            "Applied Chemistry", 4, Icons.invert_colors, 'chemistry'),
        _buildSubjectCard(
            "Applied Physics", 4, Icons.lightbulb_outline, 'physics'),
        _buildSubjectCard(
            "Engineering Mechanics", 3, Icons.directions_car, 'mechanics'),
        _buildSubjectCard("Engineering Drawing", 4, Icons.palette, 'drawing')
      ],
    );
  }
}
