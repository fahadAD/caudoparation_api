import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserListApiScreen extends StatefulWidget {
  const UserListApiScreen({super.key});

  @override
  State<UserListApiScreen> createState() => _UserListApiScreenState();
}

class _UserListApiScreenState extends State<UserListApiScreen> {
  List<dynamic> user=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add user List")),

      floatingActionButton: FloatingActionButton(onPressed: addUserListFunction,),
      body: ListView.builder(
        itemCount: user.length,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text("${index+1}"),
          title: Text("${user[index]['email']}"),
        );
      },

      ),
    );
  }
  Future<void>  addUserListFunction() async {
    const url="https://randomuser.me/api/?results=100";
      final response=await http.get(Uri.parse(url));
      final body=response.body;
      final json=jsonDecode(body);
      print(response.body);
      print(response.statusCode);
   setState(() {
     user=json["results"];
   });
  }
}
