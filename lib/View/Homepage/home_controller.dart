import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:single_api_call_dio_getx/Service/remote_service.dart';
import '../../Model/postModel.dart';

class HomeController extends GetxController with StateMixin<PostModel> {
  final Dio _dio = Dio();
  final RemoteService _remoteService = RemoteService(Dio());

  var addDataDoc = <String, dynamic>{};
  List<PostModel> dataList = <PostModel>[];

  @override
  void onInit() {
    super.onInit();
    getIn();
  }

  Future<void> getIn() async {
    change(null, status: RxStatus.loading());
    try {
      final res = await _remoteService.getSinglePost(1);
      change(res, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error());
    }
  }
}
