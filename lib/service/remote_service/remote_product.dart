import 'package:http/http.dart' as http;
import 'package:my_app_ecommerce/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=images,tages'));
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl/?populate=images,tages&filters[name][\$contains]=$keyword'));
    return response;
  }

  Future<dynamic> getByCategory({required int id}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl/?populate=images,tages&filters[category][id]=$id'));
    return response;
  }
}
