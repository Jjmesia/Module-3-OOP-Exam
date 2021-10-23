import 'package:flutter/material.dart';
import 'package:main/screen/home_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void login(String username, String password) {
      if (username == "admin" && password == "admin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHome()));
      } else {
        const snackBar = SnackBar(
            backgroundColor: Color(0xFFD50000),
            content: Text("Invalid Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800)));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/iconFlat.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: const Center(
                      child: Text(
                        'ANGRY TWITTER',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  TextField(
                    controller: userController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 50,
                        width: 100,
                        margin: const EdgeInsets.all(25),
                        child: ElevatedButton(
                          child: const Text('Login',
                              style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            login(userController.text, passwordController.text);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ))
                ],
              )),
            ])));
  }
}
