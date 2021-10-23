// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';
import 'composer.dart';
import 'create_shout.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Center(
          child: ListView(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 10.0),
                child: userShout.isEmpty
                    ? Container(
                        padding: EdgeInsets.only(top: 200),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "You Seem to be Calm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white70,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: userShout.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Color(0xFFDF33DF),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Color(0xFFDF33DF),
                                radius: 40.0,
                                backgroundImage: AssetImage('assets/myPic.png'),
                              ),
                              title: Center(
                                  child: Text(
                                "John Joshua",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )),
                              subtitle: Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  userShout[index].shout,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                ),
                              ),
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ShoutMaker(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 1.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset.zero,
                                end: const Offset(0.0, 1.0),
                              ).animate(secondaryAnimation),
                              child: child,
                            ));
                      }));
            }));
  }
}
