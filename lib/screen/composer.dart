import 'package:flutter/material.dart';
import 'create_shout.dart';
import 'home_screen.dart';

final userShoutMaker = TextEditingController();

class ShoutMaker extends StatefulWidget {
  const ShoutMaker({Key? key}) : super(key: key);

  @override
  _ShoutMakerState createState() => _ShoutMakerState();
}

class _ShoutMakerState extends State<ShoutMaker> {
  final _formKey = GlobalKey<FormState>();
  String _thisText = '';
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF53004B),
        title: Center(
          child: Image.asset(
            'assets/iconFlat.png',
            fit: BoxFit.contain,
            height: 80,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {});
                if (_thisText.isNotEmpty) {
                  userShout.add(Shouttext(shout: userShoutMaker.text));
                  userShoutMaker.clear();
                  const snackBar = SnackBar(
                      backgroundColor: Color(0xFF53004B),
                      content: Text("Anger Sent",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const MyHome()));
                } else {
                  const snackBar = SnackBar(
                      backgroundColor: Color(0xFF8D47A0),
                      content: Text("Share your Rage",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900)));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Icon(Icons.send),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)))),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                  top: 20,
                  left: 30,
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/iconFlat.png'),
                  )),
              Positioned(
                  top: 10,
                  left: 100,
                  child: SizedBox(
                    height: 300,
                    width: 265,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      autofocus: true,
                      maxLength: 240,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 50,
                      controller: userShoutMaker,
                      onChanged: (value) {
                        setState(() {
                          _thisText = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What is on your mind?',
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 20),
                        counterStyle: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                        suffixIcon: IconButton(
                          onPressed: userShoutMaker.clear,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
