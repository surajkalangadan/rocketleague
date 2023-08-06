import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled3/repositry/modelclass/rocket.dart';
import 'api_claint.dart';





class Rocketapi {
  ApiClient apiClient = ApiClient();


  Future<Rocketmodel> getRocketmodel() async {
    String trendingpath = 'https://rocket-league1.p.rapidapi.com/ranks/930226ec26174a988dff84898ee13ded';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

  return Rocketmodel.fromJson(jsonDecode(response.body));
}
}