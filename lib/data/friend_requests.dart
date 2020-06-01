import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

void sendFriendRequest(uidRequester, uidRecipient) async { //friend requests go to its own collection
  await databaseReference.collection("FriendRequests")
  .document(uidRequester).collection("requests").document(uidRecipient)
  .setData({
    'uid': uidRecipient 
  });
}

void acceptFriendRequest(uidRequestor, uidAccepter) async { //after accepted, each user will have the other's uid updated in their list
  await databaseReference.collection("Friends")
  .document(uidRequestor).collection("friendship").document(uidAccepter)
  .setData({
    'uid': uidAccepter
  });
  await databaseReference.collection("Friends")
  .document(uidAccepter).collection("friendship").document(uidRequestor)
  .setData({
    'uid': uidRequestor
  });

  await databaseReference.collection("FriendRequests")
  .document(uidRequestor).collection("requests").document(uidAccepter)
  .delete(); //delete doesnt work properly. It currently deletes the whole collection instead of only the last document
}

void denyFriendRequest(uidRequester, uidRecipient) async { //to deny request, remove it from the requests collection.
  
  // await databaseReference.runTransaction((Transaction myTransaction) async {
  //   await myTransaction.delete(databaseReference.collection("FriendRequests")
  // .document(uidRequester).collection("requests").document(uidRecipient));
  // });
  await databaseReference.collection("FriendRequests")
  .document(uidRequester).collection("requests").document(uidRecipient)
  .delete(); //delete doesnt work properly. It currently deletes the whole collection instead of only the last document
  
}
