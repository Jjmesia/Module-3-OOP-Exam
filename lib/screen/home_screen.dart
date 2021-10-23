import 'package:flutter/material.dart';
import 'package:main/screen/search.dart';
import 'package:main/screen/under_development.dart';
import 'home.dart';
import 'message.dart';
import 'notification.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Image.asset(
              'assets/iconFlat.png',
              fit: BoxFit.contain,
              height: 80,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).primaryColorDark,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text(
                  "JOHN JOSHUA MESIA",
                  style: TextStyle(fontSize: 15.0),
                ),
                accountEmail: const Text(
                  "jjmesia@mcm.edu.ph",
                  style: TextStyle(fontSize: 15.0),
                ),
                currentAccountPicture: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/myPic.png'),
                    ),
                  ),
                ),
              ),
              const ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                leading: Icon(Icons.person),
                // onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const UnderDevelopmentScreen()));
                //     }
              ),
              const Divider(
                height: 5.0,
                color: Colors.black45,
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: const <Widget>[Home(), Search(), Notificationn(), Message()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        child: TabBar(
          tabs: const <Tab>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.notifications,
                size: 30.0,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.message,
                size: 30.0,
              ),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
