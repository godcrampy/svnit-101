import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final document;
  EventPage(this.document);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xff352245),
      title: Text(
        document['title'],
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                Image.network(document['image']),
                Text(
                  document['description'].replaceAll("\\n", "\n"),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            )));
  }
}
