import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/styles/app_assets.dart';
import '../controllers/chat.dart';
import '../models/chat.dart';

part 'components/app_bar.dart';

part 'components/message_field.dart';

part 'components/message_tile.dart';

part 'components/messages_list.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getMessagesStreamBuilder,
            getMessageField,
          ],
        ),
      ),
    );
  }
}
