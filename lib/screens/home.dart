import 'package:daom/services/volunteer_nanumportal_info.dart';
import 'package:daom/themes/text_theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Home Page"),
            SizedBox(height: _height * 0.1),
            Text("1365 나눔포털에서 불러온 봉사활동 리스트", style: titleText),
            FutureBuilder(
                future: VolunteerNanumPortalInfo().getVolunteerList(1, "코로나"),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: _height * 0.25,
                      width: _width,
                      child: ListView.builder(
                        itemCount: 50,
                        padding: const EdgeInsets.only(bottom: 16.0),
                        itemBuilder: (context, index) {
                          String tempTitle = "";
                          if (snapshot.data[index]['progrmSj'].length > 30) {
                            tempTitle = snapshot.data[index]['progrmSj'].substring(0, 29) + '...';
                          } else { tempTitle = snapshot.data[index]['progrmSj']; }

                          return Column(
                            children: [
                              Text(tempTitle)
                            ],
                          );
                        },
                      ),
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
      ),
    );
  }
}