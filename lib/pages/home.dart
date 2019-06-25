import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:url_launcher/url_launcher.dart';

Widget _buildTitle(BuildContext context) {
  return InkWell(
      onTap: () {},
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('SVNIT',
            style: TextStyle(
                fontFamily: 'Oswald', fontSize: 72, color: Colors.white)),
        Text('101',
            style: TextStyle(
                fontFamily: 'Oswald', fontSize: 65, color: Color(0xfff86942))),
      ]));
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: MediaQuery.of(context).size.width * .07,
                    color: Colors.white),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * .12,
              )
            ])),
      ));
}

Widget _buildCalendarCard(BuildContext context, String text, IconData icon) {
  return GestureDetector(
      onTap: () {
        _launchURL(
            "https://github.com/godcrampy/svnit-101/raw/master/data/academic-calendar.pdf");
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                text,
                style: TextStyle(
                    fontFamily: 'Oswald',
                    fontSize: MediaQuery.of(context).size.width * .07,
                    color: Colors.white),
              ),
              Icon(
                icon,
                color: Colors.white,
                size: MediaQuery.of(context).size.width * .12,
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

Widget _buildGrid(BuildContext context) {
  return Column(children: [
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _buildCard(context, 'Curriculum', Icons.school),
      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
      _buildCard(context, 'Map', Icons.map),
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
      _buildCalendarCard(context, 'Calendar', Icons.event),
      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
      _buildCard(context, 'Settings', Icons.settings),
    ]),
    SizedBox(
      height: 10,
    )
  ]);
}

class HomePage extends StatelessWidget {
  final mainContext;
  HomePage(this.mainContext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Wrap(
                  children: <Widget>[
                    // Row(children:[
                    ListTile(
                      onTap: () {
                        LaunchReview.launch();
                        Navigator.pop(context);
                        // setState(() {});
                      },
                      leading: Icon(Icons.star),
                      title: Text('Rate'),
                    ),
                    ListTile(
                      onTap: () {
                        Share.share(
                            'SVNIT 101 \n https://play.google.com/store/apps/details?id=com.godcrampy.svnit_101');
                        Navigator.pop(context);
                        // setState(() {});
                      },
                      leading: Icon(Icons.share),
                      title: Text('Share'),
                    ),
                    ListTile(
                      onTap: () {
                        DynamicTheme.of(context).setBrightness(
                            Theme.of(context).brightness == Brightness.dark
                                ? Brightness.light
                                : Brightness.dark);
                        // setState(() {});
                      },
                      trailing: Text(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'Dark'
                              : 'Light'),
                      leading: Icon(Icons.lightbulb_outline),
                      title: Text('Theme'),
                    ),
                    SizedBox(
                      height: 150,
                    )
                  ],
                );
              });
        },
        child: Icon(Icons.favorite_border),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
