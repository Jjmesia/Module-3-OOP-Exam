import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row(
      children: const <Widget>[Icon(Icons.arrow_back)],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8D47A0),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF53004B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/under_construction.png',
                  height: 500, width: 500),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text("Hmm. This doesn't looks right",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'We are very sorry for the inconvenience' +
                      '\n This page is still under development' +
                      '\nWe hope to serve you soon!',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
