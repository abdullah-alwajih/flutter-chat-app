part of '../chat.dart';


Widget buildMessageTile(ChatModel chat) {
  bool isMe =
      chat.sender == Get.find<ChatController>().userController.user!.email ? true : false;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(chat.sender, style: Get.textTheme.caption),
        Material(
            elevation: 2,
            borderRadius: isMe
                ? const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(32),
                    bottomEnd: Radius.circular(32),
                    bottomStart: Radius.circular(32),
                  )
                : const BorderRadiusDirectional.only(
                    topStart: Radius.circular(32),
                    bottomEnd: Radius.circular(32),
                    bottomStart: Radius.circular(32),
                  ),
            color: isMe
                ? Get.theme.colorScheme.secondaryContainer
                : const Color(0xFFFAFAFA),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                chat.message,
                style: isMe
                    ? Get.textTheme.bodyText2
                    : Get.textTheme.bodyText2
                        ?.copyWith(color: Get.theme.colorScheme.onSurface),
              ),
            )),
      ],
    ),
  );
}
