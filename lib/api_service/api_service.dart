import 'package:dio/dio.dart';

import '../class/movie_class.dart';
import '../constant/api.dart';

class ApiService{
  static final dio = Dio();

  static Future<List<Products>> getProducts() async{
    try{

      final response = await dio.get(Api.url);


      List temp = (response.data).map((e) => e).toList();


      return (temp)
          .map((e) => Products.fromApi(e))
          .toList();
    }
    on DioException catch (err){
      throw '${err.response}';
    }
  }

  static Future<List<Products>> getSpecificProduct(
      {required String specific}) async{
    try{

      final response = await dio.get('${Api.jwellery}$specific');


      List temp = (response.data).map((e) => e).toList();


      return (temp)
          .map((e) => Products.fromApi(e))
          .toList();
    }
    on DioException catch (err){
      throw '${err.response}';
    }
  }
}


class AllCateService{
  static final dio = Dio();

  static Future<List> getAllCate() async{
    try{

      final response = await dio.get(Api.allCate);


      List temp = response.data;

      print(temp);

      return temp;


    }
    on DioException catch (err){
      throw '${err.response}';
    }
  }
}


