import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'Show.dart';
import 'googlemap.dart';
import '';

class DetailPage extends StatelessWidget{

  final int index;
  DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    var showlist = shows[index];
   return Scaffold(
     appBar: AppBar(
       title: Text('Detail'),
     ),
     body: ListView(
       children: <Widget> [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             height: 400,
             child: Hero(
               tag: showlist.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                showlist.image.toString(),
                fit: BoxFit.fill,
             ),
           ),
         ),
       ),
     ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // child:Padding(
          //    padding: const EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
                ),
            border: Border.all(
            color: Color(0xFFA5E1F2),
            width: 5,
            ),
          ),

             child: Column(
               //mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('공연명: ' + showlist.show_name.toString(), style: TextStyle(fontSize: 20),),
                 SizedBox(height: 10),
                 Text('출연진: ' + showlist.actors.toString(), style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                 Text('공연날짜: ' + showlist.stdate.toString() + ' ~ ' + showlist.eddate.toString(), style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                 Text('공연장소: ' + showlist.center.toString(),style: TextStyle(fontSize: 20)),
                 SizedBox(height: 10),
                // Googlemap(),
                 TextButton(
                   child: Text('공연장소 지도보기',style: TextStyle(fontSize: 18)),
                   onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Googlemap(index: index,)));
                   }
                 ),
                 Divider(height: 3),
                 SizedBox(height: 10),
                 Text('공연 후기',style: TextStyle(fontSize: 20)),
                 Consumer<ApplicationState>(
                   builder: (context, appState, _) => Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Review(
                         addMessage: (String message) =>
                              appState.addMessageToReview(message,showlist.show_name),
                         messages: appState.reviewMessages,
                         show: shows.indexOf(shows[index]),
                       ),
                     ],
                   ),
                 ),

               ],
             ),
        ),
      ),

       ],
     ),
   );
  }

}

class ReviewMessage{
  ReviewMessage({required this.name, required this.message, required this.userid, required this.document, required this.showname});
  final String name;
  final String message;
  final String userid;
  final String document;
  final String showname;
}


class Review extends StatefulWidget{
  Review({required this.addMessage, required this.messages, required this.show});
  final FutureOr<void> Function(String message) addMessage;
  final List<ReviewMessage> messages;
  //final List<Show> show = [];
  // final int index;
  int show;

  @override
  State<StatefulWidget> createState() => _ReviewState();
}

class _ReviewState extends State<Review>{
  final _formKey = GlobalKey<FormState>(debugLabel: '_ReviewState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var showlist = shows[widget.show].show_name;

   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Padding(
         padding: const EdgeInsets.all(0.0),
         child: Form(
           key: _formKey,
           child: Row(
             children: [
               Expanded(
                   child: TextFormField(
                     controller: _controller,
                     decoration: const InputDecoration(
                       hintText: '공연은 어땠나요? 감상평을 남겨주세요.'
                     ),
                     validator: (value){
                       if(value == null || value.isEmpty){
                         return '감상평을 남겨주세요.';
                       }
                       return null;
                     },
                ),
               ),
               SizedBox(width: 8),
               StyledButton(
                 onPressed: () async {
                   if(_formKey.currentState!.validate()){
                     await widget.addMessage(_controller.text);
                     _controller.clear();
                   }
                 },
                 child: Row(
                   children: [
                     Icon(Icons.send),
                     SizedBox(width: 4),
                     Text('SEND'),
                   ],
                 )
               )
             ],
           )
         ),
       ),

       SizedBox(height: 8),
       for(var message in widget.messages)
           if(message.showname.toString().compareTo(showlist.toString()) == 0)
             Container(
               child: Row(
                 children: [
                     Expanded(
                       child: Paragraph('${message.name} : ${message.message} \n ${DateTime.now()}'),),
                     SizedBox(width: 80),
                     if(FirebaseAuth.instance.currentUser!.uid == message.userid)
                       IconButton(
                         icon: Icon(Icons.delete_outline),
                         onPressed: () async {
                           await FirebaseFirestore.instance
                               .collection('review')
                               .doc(message.document).delete();
                         },
                       ),
                 ],
               ),
             ),

       SizedBox(height: 8),
     ],
   );

  }
}


/// firebase ///
class ApplicationState extends ChangeNotifier{
  ApplicationState(){
    init();
  }

  Future<void> init() async{
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user){
      if(user != null){
        _reviewSubscription = FirebaseFirestore.instance.collection('review')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _reviewMessages = [];
          snapshot.docs.forEach((document) {
            _reviewMessages.add(
              ReviewMessage(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
                userid: document.data()['userId'] as String,
                document: document.id,
                showname: document.data()['showname'] as String,
              ),
            );
          });
          notifyListeners();
        });
      }
    });
  }

  StreamSubscription<QuerySnapshot>? _reviewSubscription;
  List<ReviewMessage> _reviewMessages = [];
  List<ReviewMessage> get reviewMessages => _reviewMessages;
  // List<Show> show = [];
  // List<Show> get showinfo => show;


  Future<DocumentReference> addMessageToReview(String message, String showname){
    return FirebaseFirestore.instance.collection('review').add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name' : FirebaseAuth.instance.currentUser!.displayName == null ? '익명' : FirebaseAuth.instance.currentUser!.displayName,
      'userId' : FirebaseAuth.instance.currentUser!.uid,
      'showname': showname as String,
    });
  }

}


/// widget ///
class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.deepPurple)),
    onPressed: onPressed,
    child: child,
  );
}


class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: const TextStyle(fontSize: 24),
    ),
  );
}

class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(
      content,
      style: const TextStyle(fontSize: 18),
    ),
  );
}





