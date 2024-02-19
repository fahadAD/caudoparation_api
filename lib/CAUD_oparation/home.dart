import 'package:caud_project_api/CAUD_oparation/add_page.dart';
import 'package:caud_project_api/CAUD_oparation/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'all_repo.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <dynamic> items=[];
   AllCAUD allDataList=AllCAUD();
   @override
  void initState() {
    // TODO: implement initState
    allDataList.allData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data List")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage(),));
      },child: Icon(Icons.add,)),
      body: FutureBuilder(
        future: allDataList.allData(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.items?.length,
            itemBuilder: (BuildContext context, int index) {
              var data=snapshot.data!.items?[index];
              var dataId=snapshot.data!.items?[index].sId;
              return Card(
                child: ListTile(
                  isThreeLine: true,

                   leading: Text("${index}"),
                   title: Text(data!.title.toString()),
                  subtitle: Text(data.description.toString()),
                 trailing: PopupMenuButton(
                   onSelected: (value) {
                     if(value=="view"){

                     }else if(value=="edit"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EdittedPage(edit_data: data),));
                     }else if(value=="delete"){
                       deleteData(id: dataId.toString());
                     }
                   },
                   itemBuilder: (context) {

                   return [
                     const PopupMenuItem(
                         child: Text("View"),
                       value: 'view',
                     ),
                     const PopupMenuItem(
                         child: Text("Edit"),
                       value: 'edit',
                     ),
                     const PopupMenuItem(child: Icon(Icons.delete),
                       value: 'delete',
                     ),
                   ];
                 },),
                ),
              );
            },

          );
        }else{
          return Center(child: CircularProgressIndicator());
          }
      },),
    );

  }

   Future<void> deleteData({required String id}) async {
     final String uri="https://api.nstack.in/v1/todos/$id";
     var response=await http.delete(Uri.parse(uri));



     if(response.statusCode==200){
       print('================ Delete Success');

       final filtered=items.where((element) => element['_id']!=id).toList();
       setState(() {
         items=filtered;
       });
     }else{
       print('================ Delete not Success');
       print(response.body);
       print(response.statusCode);
     }


   }
}
