import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countrydata.dart';
import 'faqs.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get("https://www.disease.sh/v2/all");
    setState(() {
      worldData = json.decode(response.body);
    });
  }


  @override
  void initState() {
    fetchWorldWideData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("COVID19 TRACKING APP",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new Container(
        padding: const EdgeInsets.all(20),
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Padding(padding: const EdgeInsets.only(top:10)),
              new Text("Worldwide",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              new Card(
                color: Colors.red[200],
                child: new ListTile(
                  title: new Text("CONFIRMED",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                  subtitle: new Text(worldData['cases'].toString(),style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                ),
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new Card(
                color: Colors.blue[200],
                child: new ListTile(
                  title: new Text("ACTIVE",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                  subtitle: new Text(worldData['active'].toString(),style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                ),
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new Card(
                color: Colors.green[200],
                child: new ListTile(
                  title: new Text("RECOVERED",style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                  subtitle: new Text(worldData['recovered'].toString(),style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                ),
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new Card(
                color: Colors.grey,
                child: new ListTile(
                  title: new Text("DEATHS",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  subtitle: new Text(worldData['deaths'].toString(),style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new Padding(padding : const EdgeInsets.only(top: 40)),
              new MaterialButton(
                color: Color(0x000080),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                    new Text("FAQs",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    new Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FaqPage() ));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new MaterialButton(
                color: Color(0x000080),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                    new Text("Donate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    new Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed:() {
                  launch("www.pmcares.gov.in");
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              new MaterialButton(
                color: Color(0x000080),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                    new Text("Country Stats",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                    new Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CountryData() ));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ],
          ),
        )
      ),
    );
  }
}