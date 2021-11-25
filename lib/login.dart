import 'package:flutter/material.dart';

import 'home.dart';
import 'Show.dart';
import 'load_shows.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ShowRepository().fetchShow();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 300.0),
            Column(
              children: [
                Container(
                  child: RaisedButton(
                    onPressed: () async{
                      // signInWithGoogle();
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(Shows: shows)));
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                    },
                    child:Text("GOOGLE"),
                    color: Colors.redAccent[100],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Column(
              children: [
                Container(
                  child: RaisedButton(
                    onPressed: () async{
                      // signInAnonymously();
                      // ShowRepository().fetchShow();
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(Shows: shows)));
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                    },
                    child:Text("GUEST"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}