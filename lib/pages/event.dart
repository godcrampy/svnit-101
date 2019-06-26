import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends StatelessWidget {
  final document;
  EventPage(this.document);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: document['meta']['url'] != 'null'
          ? FloatingActionButton.extended(
              backgroundColor: Colors.blue,
              label: Text(document['meta']['link']),
              icon: Icon(Icons.link),
              onPressed: () {
                _launchURL(document['meta']['url']);
              },
            )
          : Container(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff352245),
      title: Text(
        "",
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 7),
            child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: Text(
            document['title'],
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          title: Text(
            document['subtitle'],
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff727272),
              fontFamily: 'Title',
            ),
          ),
          trailing: Text(
            document['date'],
            style: TextStyle(
                fontSize: 15, color: Color(0xff727272), fontFamily: 'Title'),
          ),
        ),
        Image.network(document['image']),
        SizedBox(
          height: 18,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              document['description'].replaceAll("\\n", "\n"),
              style: TextStyle(fontSize: 18, fontFamily: 'Title'),
            )),
        SizedBox(
          height: 50,
        )
      ],
    )));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
