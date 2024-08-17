import 'package:http/http.dart' as http;
import 'package:my_app_ecommerce/const.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/benners';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=image')
    );
    return response;
  }
}