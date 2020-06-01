import 'package:flutter/material.dart';
//import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'data/friend_requests.dart';
//import 'list_of_items.dart';
  

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String uidRequester = "61044768-a41e-11ea-bb37-0242ac130002";
  String uidRecipient = "22044468-a41e-11ea-bb37-0242ac130002";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(backgroundColor: Colors.black,),

      body: Center(
        child: Column(
          children: <Widget>[
     
        RaisedButton(
          child: Text('Send Friend Request'),
          onPressed: () {
        sendFriendRequest(uidRequester, uidRecipient);
                },
            ),
        RaisedButton(
          child: Text('Accept Friend Request'),
          onPressed: () {
        acceptFriendRequest(uidRequester, uidRecipient);
                },
            ),
        RaisedButton(
          child: Text('Deny Friend Request'),
          onPressed: () {
        denyFriendRequest(uidRequester, uidRecipient);
                },
            ),
          ]
        ),
      ),
    );
  }
}