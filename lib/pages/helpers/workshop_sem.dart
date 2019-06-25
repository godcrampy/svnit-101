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

class WorkshopSem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSubjectCard(
            "Electro Techniques", 4, Icons.ev_station, 'electrical'),
        _buildSubjectCard(
            "Engineering Mathematics", 4, Icons.functions, 'maths'),
        _buildSubjectCard("Basics of Electronics Engineering", 4,
            Icons.battery_charging_full, 'electronics'),
        _buildSubjectCard("Basic Mechanical Systems", 3, Icons.toys, 'bms'),
        _buildSubjectCard(
            "Fundamentals of Computer Programming", 5, Icons.code, 'computers'),
        _buildSubjectCard("English and Communication Skills", 2,
            Icons.local_library, 'english'),
        _buildSubjectCard("Workshop", 2, Icons.settings, 'workshop')
      ],
    );
  }
}
