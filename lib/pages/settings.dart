import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import './helpers/smile_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildBody() {
    bool _lights =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    return SingleChildScrollView(
        child: Container(
      child: Column(children: <Widget>[
        _buildDarkModeTile(_lights),
        Divider(
          height: 10,
        ),
        _buildReviewTile(),
        _buildShareTile(),
        Divider(
          height: 10,
        ),
        _buildMadeByCard(),
        SizedBox(
          height: 10,
        )
      ]),
    ));
  }

  Widget _buildDarkModeTile(bool lights) {
    return MergeSemantics(
      child: ListTile(
        leading: Icon(Icons.lightbulb_outline),
        title: Text(
          'Dark Mode',
          style: TextStyle(fontSize: 20),
        ),
        trailing: Switch(
          activeColor: Colors.deepOrange,
          value: lights,
          onChanged: (bool value) {
            setState(() {
              lights = value;
              DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark);
            });
          },
        ),
        onTap: () {
          setState(() {
            lights = !lights;
          });
        },
      ),
    );
  }

  Widget _buildReviewTile() {
    return ListTile(
      onTap: () {
        LaunchReview.launch();
        // setState(() {});
      },
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: Icon(Icons.star),
      title: Text(
        'Rate',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildShareTile() {
    return ListTile(
      onTap: () {
        Share.share(
            'SVNIT 101 \n https://play.google.com/store/apps/details?id=com.godcrampy.svnit_101');
      },
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: Icon(Icons.share),
      title: Text('Share', style: TextStyle(fontSize: 20)),
    );
  }

  Widget _buildMadeByCard() {
    return Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Container(
            child: Column(children: [
          _buildMadeByCardTitle(),
          _buildMadeByCardLinkTile("@godcrampy", "https://github.com/godcrampy",
              Smile.github_circled_1),
          _buildMadeByCardLinkTile("Source Code",
              "https://github.com/godcrampy/svnit-101", Icons.code),
        ])));
  }

  Widget _buildMadeByCardTitle() {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Smile.emo_laugh),
      ),
      title: Text("Handcrafted by", style: TextStyle()),
      subtitle: Text("Sahil Bondre", style: TextStyle(fontSize: 20)),
    );
  }

  Widget _buildMadeByCardLinkTile(String title, String url, IconData icon) {
    return InkWell(
        onTap: () {
          _launchURL(url);
        },
        child: ListTile(
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(icon),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.blue,
              ),
            )));
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.settings),
      backgroundColor: Color(0xff352245),
      title: Text(
        'Settings',
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
