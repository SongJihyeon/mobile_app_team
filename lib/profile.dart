import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ProfilePageState();

}

class ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Page'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.exit_to_app,
        //       semanticLabel: 'logout',
        //     ),
        //     onPressed: () {
        //       FirebaseAuth.instance.signOut();
        //       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
        //     },
        //   ),
        // ],
      ),
    );
  }

}