class ChatModel {
  final String sender;
  final String message;
  final dynamic dateTime;

  const ChatModel({
    required this.sender,
    required this.message,
    required this.dateTime,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) => ChatModel(
        sender: map['sender'] ?? '',
        message: map['message'] ?? '',
        dateTime: map['date_time'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'sender': sender,
        'message': message,
        'date_time': dateTime,
      };

  void fromMapList(List data) {}
}
