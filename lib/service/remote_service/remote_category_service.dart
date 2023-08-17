import 'package:flutter_application/const.dart';
import 'package:http/http.dart' as http;

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=image'));

    return response;
  }
}
