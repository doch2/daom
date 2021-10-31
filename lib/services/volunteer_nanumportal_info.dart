import 'package:daom/models/volunteer_nanumportal.dart';
import 'package:daom/token_reference.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class VolunteerNanumPortalInfo {
  final Dio _dio = Get.find<Dio>();

  String apiToken = TokenReference().nanumPortalToken;

  Future<List> getVolunteerList(int pageNum, String keyword) async {
    Response response = await _dio.get(
        'http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList',
        queryParameters: {"serviceKey": apiToken, "numOfRows": 50, "pageNo": pageNum, "keyword": keyword});

    return VolunteerNanumPortal.toList(response.data).volunteerList;
  }
}