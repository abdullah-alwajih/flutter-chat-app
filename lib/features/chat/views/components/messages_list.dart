part of '../chat.dart';

Widget get getMessagesStreamBuilder {
  final controller = Get.find<ChatController>();
  return StreamBuilder<QuerySnapshot>(
    stream: controller.collectionMessages.orderBy('date_time').snapshots(),
    builder: (_, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const CircularProgressIndicator();
        case ConnectionState.done:
          {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            final List<Widget> widgets = <Widget>[];

            final messages = snapshot.data!.docs.reversed;
            for (var message in messages) {
              ChatModel chat =
                  ChatModel.fromMap(message.data() as Map<String, dynamic>);

              widgets.add(buildMessageTile(chat));
            }
            return Expanded(
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.background),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  reverse: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  children: widgets,
                ),
              ),
            );
          }
        default:
          return const CircularProgressIndicator();
      }
    },
  );
}
