import 'package:fast_app/Model/chat.dart';
import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/screens/chat/chat_api.dart';
import 'package:flutter/material.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  List<Chat>? cList;
  List<Chat2>? onlineChatp;

  TextEditingController replyController = TextEditingController();
  @override
  void initState() {
    getOnlineChat();

    getOfflineChat();
    setState(() {});

    super.initState();
  }

  getOnlineChat() async {
    final api = ChatApi();

    onlineChatp = await api.getChat(1);
  }

  getOfflineChat() {
    cList = [
      Chat(
          id: 1,
          message: "Hello brother",
          senderId: 0,
          receiverId: 0,
          isSender: true,
          time: "5:58"),
      Chat(
          id: 1,
          message: "Hii how are u?",
          isSender: false,
          senderId: 0,
          receiverId: 0,
          time: "5:59"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Abdul sami",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(children: [
        const Divider(),
        cList == null
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: cList!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          textDirection: !cList![index].isSender
                              ? TextDirection.rtl
                              : null,
                          children: [
                            cList![index].profileUrl == null
                                ? const CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    backgroundImage:
                                        AssetImage('images/avatar.jpg'))
                                : CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    backgroundImage:
                                        NetworkImage(cList![index].profileUrl!),
                                  ),
                            Card(
                                color: cList![index].isSender
                                    ? backgroundColor
                                    : primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    cList![index].message,
                                    style: TextStyle(
                                        color: !cList![index].isSender
                                            ? Colors.white
                                            : null),
                                  ),
                                )),
                            Text(
                              cList![index].time,
                              style: TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                      );
                    }),
              )),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: replyController,
            cursorColor: primaryColor,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "Write a reply"),
          ),
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: Icon(Icons.filter)),
            IconButton(onPressed: () {}, icon: Icon(Icons.file_copy_rounded)),
            Spacer(),
            TextButton(
                onPressed: () {
                  if (replyController.text != "")
                    cList!.add(Chat(
                        id: 1,
                        message: "${replyController.text}",
                        senderId: 0,
                        receiverId: 0,
                        time: "6:00"));
                  setState(() {});
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: primaryColor),
                ))
          ],
        )
      ]),
    );
  }
}
