import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/const/goto.dart';
import 'package:fast_app/screens/chat/chat_message_screen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Chat",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            const Divider(
              thickness: 1.3,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatMessageScreen()));
                      },
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: backgroundColor,
                            ),
                            title: Text("Abdul Sami"),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text("no new message"),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
