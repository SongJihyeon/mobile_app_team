import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('My Page', style: TextStyle(color:Colors.black)),
        backgroundColor: Color(0xFFA9E6D2),
      ),

      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 8.0, 16.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 200),

                Container(
                  height: 50,
                  width: 380,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFA9E6D2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )
                  ),

                  child: Text(
                      'ID',
                      style: TextStyle(fontSize: 20),
                  ),
                ),

              SizedBox(height: 10),
              Container(
                height: 50,
                width: 380,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  border: Border.all(
                    color: Color(0xFFA9E6D2),
                    width: 2,
                  ),
                ),

                child: Text(
                  FirebaseAuth.instance.currentUser!.isAnonymous
                      ? 'GuestLogin'
                 :FirebaseAuth.instance.currentUser!.displayName.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 60),

              Container(
                height: 50,
                width: 380,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFFA9E6D2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )
                ),
                child: Text(
                  'Google Account',
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 10),

              Container(

                height: 50,
                width: 380,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Color(0xFFA9E6D2),
                    width: 2,
                  ),
                ),

                child: Text(
                  FirebaseAuth.instance.currentUser!.isAnonymous
                      ? FirebaseAuth.instance.currentUser!.uid
                      :FirebaseAuth.instance.currentUser!.email.toString(),
                  style: TextStyle(fontSize: 20),),
              ),
              SizedBox(height: 80),

            ],
          ),
        ),
      ),
    );
  }

}