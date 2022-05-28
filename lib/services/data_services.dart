import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/data_model.dart';

class DataServices{
  String baseURL = "http://mark.bslmeiyu.com/api/getplaces";
  Future<List<DataModel>>getInfo() async {

    http.Response res= await http.get(Uri.parse(baseURL));
    try{
       if(res.statusCode==200){
        List<dynamic> list= json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
       }else{
         return <DataModel>[];
       }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}