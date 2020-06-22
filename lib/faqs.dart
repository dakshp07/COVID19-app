import 'package:flutter/material.dart';
import 'faqmodel.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("FAQs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (context , index) =>
              new ExpansionTile(
                title: new Text(data[index].question,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),
                children: <Widget>[
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new Text(data[index].answer,style: new TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[500]),),
                    new Padding(padding: const EdgeInsets.only(bottom: 10)),
                  ],
              )
      ),
    );
  }
}
