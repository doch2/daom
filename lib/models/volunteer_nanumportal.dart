import 'dart:convert';

import 'package:xml2json/xml2json.dart';

class VolunteerNanumPortal {
  VolunteerNanumPortal({
    required this.volunteerList,
  });

  final List volunteerList;

  factory VolunteerNanumPortal.toList(dynamic originalData) {
    Xml2Json xml2Json = Xml2Json();

    xml2Json.parse(originalData);
    Map data = jsonDecode(xml2Json.toParker());


    return VolunteerNanumPortal(
      volunteerList: (data['response']['body']['items'])['item'],
    );
  }
}
