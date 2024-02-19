import 'package:caud_project_api/CAUD_oparation/all_repo.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'model.dart';
class EdittedPage extends StatefulWidget {
  const EdittedPage({super.key, required this.edit_data});
final Items edit_data;
  @override
  State<EdittedPage> createState() => _EdittedPageState();
}

class _EdittedPageState extends State<EdittedPage> {
  TextEditingController ed_tittle_Controller=TextEditingController();
  TextEditingController ed_desc_Controller=TextEditingController();
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
      appBar: AppBar(title: Text("Data EDIT")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            TextFormField(
                initialValue: widget.edit_data.title,
              onChanged: (value) {
                 ed_tittle_Controller.text=value;
              },
              decoration: InputDecoration(
                  hintText: "Tittle",

              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              initialValue: widget.edit_data.description,
              onChanged: (value) {
                ed_desc_Controller.text=value;
              },
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              minLines: 3,
              maxLines: 5,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              setState(() {
                submitData.submitData(
                    title: ed_tittle_Controller.text,
                    description: ed_desc_Controller.text);
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