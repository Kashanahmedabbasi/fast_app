class Chat {
  int id;
  String message;
  bool isSender;
  int senderId;
  int receiverId;
  String time;
  String? profileUrl;
  Chat(
      {this.isSender = false,
      required this.id,
      required this.message,
      required this.senderId,
      required this.receiverId,
      required this.time,
      this.profileUrl});
}

class Chat2 {
  Chat2({
    required this.senderId,
    required this.recieverId,
    required this.senderName,
    required this.recieverName,
    required this.message,
    required this.time,
    required this.senderImage,
    required this.recieverImage,
  });

  int? senderId;
  int? recieverId;
  String? senderName;
  String? recieverName;
  String? message;
  DateTime? time;
  String? senderImage;
  String? recieverImage;
  factory Chat2.fromJson(Map<String, dynamic> json) {
    return Chat2(
      senderId: json["senderId"],
      recieverId: json["recieverId"],
      senderName: json["senderName"],
      recieverName: json["recieverName"],
      message: json["message"],
      time: DateTime.tryParse(json["time"] ?? ""),
      senderImage: json["senderImage"],
      recieverImage: json["recieverImage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "recieverId": recieverId,
        "senderName": senderName,
        "recieverName": recieverName,
        "message": message,
        "time": time?.toIso8601String(),
        "senderImage": senderImage,
        "recieverImage": recieverImage,
      };
}
