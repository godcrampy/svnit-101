import 'package:flutter/material.dart';
import 'package:svnit_101/pages/helpers/drawing_sem.dart';
import 'package:svnit_101/pages/helpers/workshop_sem.dart';

class CurriculumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.school),
            backgroundColor: Color(0xff352245),
            title: Text(
              'Curriculum',
              style: TextStyle(fontSize: 25),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.edit),
                  text: 'Drawing Semester',
                ),
                Tab(
                  icon: Icon(Icons.build),
                  text: 'Workshop Semester',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[DrawingSem(), WorkshopSem()],
          ),
        ));
  }
}
