import 'package:caud_project_api/CAUD_oparation/all_repo.dart';
import 'package:flutter/material.dart';

import 'home.dart';
class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController tittle_Controller=TextEditingController();
  TextEditingController desc_Controller=TextEditingController();
  AllCAUD submitData=AllCAUD();
  @override
  void initState() {
    // TODO: implement initState
    AllCAUD();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data ADD")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(height: 20,),
          TextFormField(
            controller: tittle_Controller,
            decoration: InputDecoration(
              hintText: "Tittle"

            ),
          ),
            SizedBox(height: 20,),
            TextFormField(
              controller: desc_Controller,
              decoration: InputDecoration(
                  hintText: "Description",

              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
       setState(() {
         submitData.submitData(
             title: tittle_Controller.text,
             description: desc_Controller.text);
         print("Fahad Already click submit button");
         Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
       });
            }, child: Text("Submitted"))
          ],
        ),
      ),
    );
  }




}