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
        _launchURL(
            'https://github.com/godcrampy/svnit-101/raw/master/data/drawing-sem/' +
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
                  Text(
                      credits != 0
                          ? credits.toString() + " credits"
                          : "0 credits 😆",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right, size: 30.0))));
}

class DrawingSem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildSubjectCard("Mathematics-I ", 4, Icons.functions, 'maths'),
        _buildBranchSpecificCard(),
        _buildSubjectCard("Mechanics, Lasers and Fiber Optics", 4,
            Icons.lightbulb_outline, 'mlf'),
        _buildSubjectCard(
            "Applied Chemistry", 4, Icons.invert_colors, 'chemistry'),
        _buildSubjectCard("Engineering Drawing", 4, Icons.palette, 'drawing'),
        _buildSubjectCard("Energy and Environmental Engineering", 4,
            Icons.ev_station, 'environment'),
        _buildSubjectCard("Holistic Empowerment and Human Values", 0,
            Icons.palette, 'holistic')
      ],
    );
  }

  Widget _buildBranchSpecificCard() {
    return Card(
        elevation: 7.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ExpansionTile(
            children: <Widget>[
              _buildListTile("Civil Engineering", Icons.domain, "civil"),
              _buildListTile(
                  "Computer Engineering", Icons.computer, "computers"),
              _buildListTile(
                  "Chemical Engineering", Icons.invert_colors, "chemical"),
              _buildListTile("Electrical and Electronics Engineering",
                  Icons.power, "electrical-electronics"),
              _buildListTile(
                  "Mechanical Engineering", Icons.directions_car, "mechanical"),
              _buildListTile(
                  "Applied Chemistry", Icons.ac_unit, "applied-chemistry"),
              _buildListTile(
                  "Applied Mathematics", Icons.all_inclusive, "applied-maths"),
              _buildListTile(
                  "Applied Physics", Icons.flash_on, "applied-physics"),
            ],
            title: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 7.0, vertical: 1.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(),
                child: Icon(
                  Icons.account_balance,
                  size: 28,
                ),
              ),
              title: Text(
                "Branch Specific Course",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text("4 credits",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))
                ],
              ),
            )));
  }

  Widget _buildListTile(String title, IconData icon, String key) {
    return InkWell(
      onTap: () {
        _launchURL("https://github.com/godcrampy/svnit-101/raw/master/data/" +
            key +
            ".pdf");
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}
