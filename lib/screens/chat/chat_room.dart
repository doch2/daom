import 'dart:async';

import 'package:daom/controllers/chat_controller.dart';
import 'package:daom/services/realtime_database.dart';
import 'package:daom/themes/text_theme.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoom extends GetWidget<ChatController> {
  ChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    final messageTextController = TextEditingController();
    final messageViewController = ScrollController();

    DatabaseReference messageRef = RealtimeDatabase().getMessageDatabase(controller.nowChatRoomID);

    Timer(
      Duration(seconds: 1),
          () => messageViewController.jumpTo(messageViewController.position.maxScrollExtent),
    );

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: _width,
              height: _height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Chat Room Page"),
                SizedBox(height: _height * 0.1),
                SizedBox(
                  width: _width,
                  height: _height * 0.4,
                  child: FirebaseAnimatedList(
                    query: messageRef,
                    controller: messageViewController,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return SizeTransition(
                        sizeFactor: animation,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: _width * 0.1),
                                SizedBox(
                                  width: _width * 0.1,
                                  height: _width * 0.1,
                                  child: ClipOval(
                                    child: ExtendedImage.network(
                                        controller.miniUserInfo[snapshot.value["user"]]["profileImg"],
                                        cache: true
                                    ),
                                  ),
                                ),
                                SizedBox(width: _width * 0.025),
                                Text(
                                  '${controller.miniUserInfo[snapshot.value["user"]]["name"]}: \n${snapshot.value["content"]}',
                                ),
                                SizedBox(height: _width * 0.12),
                              ],
                            ),
                            Positioned(
                              right: _width * 0.1,
                              child: IconButton(
                                onPressed: () =>
                                    messageRef.child(snapshot.key!).remove(),
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Positioned(
              bottom: _width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _width * 0.8,
                    child: TextField(
                      controller: messageTextController,
                      keyboardType: TextInputType.multiline,
                      minLines: null,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: '메세지를 작성해주세요.',
                      ),
                      style: chatWriteMessage,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.sendMessage(messageTextController.text);
                      messageTextController.clear();
                    },
                    child: Icon(Icons.send),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}