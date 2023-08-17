import 'package:flutter_application/const.dart';
import 'package:http/http.dart' as http;

class RemotePopularCategoryService {
  var Client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';
  Future<dynamic> get() async {
    var response = await Client.get(Uri.parse(
        '$remoteUrl?populate=category,category.image&pagination[start]=0&pagination[limit]=1'));
    return response;
  }
}
