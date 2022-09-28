part of '../chat.dart';

Container get getMessageField {
  final controller = Get.find<ChatController>();

  return Container(
    decoration: BoxDecoration(
      border: Border(
          top: BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.textMessageController,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              hintText: 'Write your message here...',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
            onPressed: controller.sendMessage,
            icon: Transform.rotate(
                angle: 1 * pi, child: const Icon(Iconsax.send_1)))
      ],
    ),
  );
}
