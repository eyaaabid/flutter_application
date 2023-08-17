import 'package:flutter_application/const.dart';
import 'package:http/http.dart' as http;

class RemotePopularTraining {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-trainings';

  Future<dynamic> get() async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=images,training.images,training.tags'));
    return response;
  }
}
