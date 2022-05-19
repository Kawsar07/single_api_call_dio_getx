import 'package:dio/dio.dart';
import '../Model/postModel.dart';

class RemoteService {
  final Dio _dio = Dio();
  final Dio dio;

  RemoteService(this.dio);

  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<PostModel?> getSinglePost(int id) async {
    final url = baseUrl + '/posts/' + id.toString();
    try {
      final receive = await _dio.get(url);
      if (receive.statusCode == 200) {
        return PostModel.fromJson(receive.data);
      } else {
        // print('${receive.statusCode} : ${receive.data.toString()}');
        throw receive.statusCode!;
      }
    } catch (error) {
      // print(reactive);
    }
    return null;
  }
}
