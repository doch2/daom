import 'package:daom/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daom/screens/chat/chat_room.dart';

class ChatMain extends GetWidget<ChatController> {
  ChatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

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
                Text("Chat Page"),
                SizedBox(height: _height * 0.1,),
                FutureBuilder(
                    future: controller.getChatRoomList(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) { //데이터를 정상적으로 받았을때
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width:  _width,
                              height: _height * 0.5,
                              child: ListView.builder(
                                padding: const EdgeInsets.only(bottom: 32.0),
                                itemCount: controller.chatRoomList.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      controller.nowChatRoomID = controller.chatRoomList[index];
                                      Get.to(ChatRoom());
                                    },
                                    title: Text(
                                      controller.chatRoomInfo[controller.chatRoomList[index]]["title"],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      } else if (snapshot.hasError) { //데이터를 정상적으로 불러오지 못했을 때
                        return Column(
                          children: [
                            Text("데이터를 정상적으로 불러오지 못했습니다. \n다시 시도해 주세요.", textAlign: TextAlign.center)
                          ],
                        );
                      } else { //데이터를 불러오는 중
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(child: CircularProgressIndicator()),
                          ],
                        );
                      }
                    }
                ),
              ],
            ),
            Positioned(
              right: _height * 0.04,
              bottom: _width * 0.05,
              child: FloatingActionButton(
                  onPressed: () => controller.createChatRoom(),
                  child: Icon(Icons.add)
              ),
            )
          ],
        )
      ),
    );
  }
}