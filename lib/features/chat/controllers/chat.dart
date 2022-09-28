import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/features/chat/models/chat.dart';
import 'package:get/get.dart';

import '../../user/controllers/user_controller.dart';

class ChatController extends GetxController {
  UserController userController = Get.find<UserController>();
  final collectionMessages = FirebaseFirestore.instance.collection('messages');
  TextEditingController textMessageController = TextEditingController();
  var messages = RxList<ChatModel>();

  @override
  void onInit() {
    super.onInit();
    getMessages();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return collectionMessages.snapshots();

    // final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
    //     (await collectionMessages.get()).docs;
    // messages.value =
    //     docs.map((element) => ChatModel.fromMap(element.data())).toList();

    // Stream
    // await for ( var snapshot in collectionMessages.snapshots()){
    //   for(var message in snapshot.docs){
    //
    //     messages.add(ChatModel.fromMap(message.data()));
    //   }
  }

  Future<void> sendMessage() async {
    Map<String, dynamic> data = ChatModel(
      message: textMessageController.text.trim(),
      sender: userController.kFireAuth.currentUser?.email ?? '',
      dateTime: FieldValue.serverTimestamp(),
    ).toMap();
    textMessageController.clear();
    await collectionMessages.add(data);
  }
}
