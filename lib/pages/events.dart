import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:svnit_101/pages/event.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.event),
      backgroundColor: Color(0xff352245),
      title: Text(
        'Update',
        style: TextStyle(fontSize: 25),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: Text('Loading...'));
          default:
            return ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return _buildCard(context, document);
              }).toList(),
            );
        }
      },
    );
  }

  Widget _buildCard(BuildContext context, DocumentSnapshot document) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventPage(document)));
            },
            child: Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(7)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: document['isLandscape']
                          ? MediaQuery.of(context).size.width * 0.5
                          : MediaQuery.of(context).size.width * 1.0,
                      child: Image(
                        image: NetworkImage(document['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                      // padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                    subtitle: Text(document['subtitle']),
                    trailing: Text(document['date']),
                    title: Text(document['title'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  )),
                ],
              ),
            )));
  }
}