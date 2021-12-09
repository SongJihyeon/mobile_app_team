import 'package:flutter/material.dart';
import 'dart:async';

import 'home.dart';
import 'Show.dart';
import 'load_shows.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

enum ApplicationLoginState {
  google,
  anonymously,
  loggedIn,
  loggedOut,
}

class Authentication extends StatelessWidget{
  const Authentication({
    required this.loginState,
    required this.signInWithGoogle,
    required this.signInAnonymously,
    required this.signOut
  });

  final ApplicationLoginState loginState;
  final Future<UserCredential> signInWithGoogle;
  final void Function() signInAnonymously;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {

    switch (loginState) {
      case ApplicationLoginState.loggedIn:
        return  const HomePage();
      case ApplicationLoginState.loggedOut:
        return const LoginPage();
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }
}


final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name = "";
String email = "";
String url = "";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // ShowRepository().fetchShow();
    ShowRepository().fetchloaction();
    
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: const <Widget>[
            SizedBox(height: 80.0),
            SizedBox(height: 120.0),
            GoogleButton(),
            SizedBox(height: 5.0),
            AnonymousSigninButton(),
          ],
        ),
      ),
    );
  }
}

class GoogleButton extends StatefulWidget{
  const GoogleButton({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => GoogleButtonState();
}

class GoogleButtonState extends State<GoogleButton>{


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: RaisedButton(
            onPressed: () async{
              signInWithGoogle();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
            },
            child:Text("GOOGLE"),
            color: Colors.redAccent[100],
          ),
        ),
      ],
    );
  }


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("google login");

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOutWithGoogle() async{
    await googleSignIn.signOut();
    print("User Sign Out");
  }
}

class AnonymousSigninButton extends StatefulWidget {
  const AnonymousSigninButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnonymousSigninButtonState();
}

class AnonymousSigninButtonState extends State<AnonymousSigninButton>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: RaisedButton(
            onPressed: () async{
              signInAnonymously();
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
            },
            child:Text("GUEST"),
          ),
        ),
      ],
    );
  }

  void signInAnonymously() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

    print("GUEST Login");
  }

  void signOut() async{
    FirebaseAuth.instance.signOut();
  }
}
