import 'dart:convert';
  import 'package:caud_project_api/CAUD_oparation/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class AllCAUD{

 Future<void> submitData({required String title,required String description}) async {
   final String uri="https://api.nstack.in/v1/todos";
   final body={
     "title": title,
     "description": description,
     "is_completed": false
   };

   final response=await http.post(Uri.parse(uri),
      body: jsonEncode(body),
   headers:{
     'accept': 'application/json',
     'Content-Type': 'application/json'
   },
   );

   if(response.statusCode==201){
     print('================ Data Successfully Added');
   }else{
     print("================error++++++++++++++++++++++++");
     print(response.body);
     print(response.statusCode);
   }
 }

 Future<DataModel> allData() async {
   final String uri="https://api.nstack.in/v1/todos?page=1&limit=10";
 var response=await http.get(Uri.parse(uri));

 print(response.body);
 print(response.statusCode);

 var data=jsonDecode(response.body);
 return DataModel.fromJson(data);


 }


}
