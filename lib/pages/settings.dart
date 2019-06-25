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
        MergeSemantics(
          child: ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text(
              'Dark Mode',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Switch(
              activeColor: Colors.deepOrange,
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                  DynamicTheme.of(context).setBrightness(
                      Theme.of(context).brightness == Brightness.dark
                          ? Brightness.light
                          : Brightness.dark);
                });
              },
            ),
            onTap: () {
              setState(() {
                _lights = !_lights;
              });
            },
          ),
        ),
        Divider(
          height: 10,
        ),
        ListTile(
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
        ),
        ListTile(
          onTap: () {
            Share.share(
                'SVNIT 101 \n https://play.google.com/store/apps/details?id=com.godcrampy.svnit_101');
          },
          trailing: Icon(Icons.keyboard_arrow_right),
          leading: Icon(Icons.share),
          title: Text('Share', style: TextStyle(fontSize: 20)),
        ),
        Divider(
          height: 10,
        ),
        Card(
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
                child: Column(children: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Smile.emo_laugh),
                ),
                title: Text("Handcrafted with ♥ by", style: TextStyle()),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Text("Sahil Bondre", style: TextStyle(fontSize: 20)),
              ),
              InkWell(
                  onTap: () {
                    _launchURL("https://github.com/godcrampy");
                  },
                  child: ListTile(
                      // contentPadding:
                      // EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Smile.github_circled_1),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(
                        "@godcrampy",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))),
              InkWell(
                  onTap: () {
                    _launchURL("https://github.com/godcrampy/svnit-101");
                  },
                  child: ListTile(
                      // contentPadding:
                      // EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.code),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      title: Text(
                        "Source Code",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))),
            ]))),
        SizedBox(
          height: 10,
        )
      ]),
    ));
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
