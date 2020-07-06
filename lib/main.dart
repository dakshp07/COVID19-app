import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'countrydata.dart';
import 'faqs.dart';



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
      drawer : new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("COVID19 Tracking App",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                accountEmail: new Text("covid19help@gmail.com",style: TextStyle(fontSize: 15,color: Colors.white),),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.red[400],
                  child: new Text("CT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                )  ,
            ),
            new ListTile(
              title: new Text("Worldwide Stats",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.show_chart,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage() ));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new ListTile(
              title: new Text("Country Stats",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.show_chart,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CountryData() ));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new ListTile(
              title: new Text("FAQs",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.arrow_forward,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FaqPage() ));
              },
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new Divider(
              height: 10,thickness: 2,color: Colors.grey[700],
            ),
            new Padding(padding: const EdgeInsets.only(top: 10)),
            new ListTile(
              title: new Text("Close",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: new Icon(Icons.close,size: 20,color: Colors.white,),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: worldData == null ? new Center(
        child: new CircularProgressIndicator(),
      ) : new Container(
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
                    subtitle: new Row(
                      children: <Widget>[
                        new Text(worldData['cases'].toString(),style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                        new Padding(padding: const EdgeInsets.symmetric(horizontal: 40)),
                        new Icon(Icons.arrow_upward,color: Colors.red,),
                        new Text(worldData['todayCases'].toString(),style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),)
                      ],
                    ),
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
                      subtitle: new Row(
                        children: <Widget>[
                          new Text(worldData['recovered'].toString(),style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                          new Padding(padding: const EdgeInsets.symmetric(horizontal: 40)),
                          new Icon(Icons.arrow_upward,color: Colors.green,),
                          new Text(worldData['todayRecovered'].toString(),style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),)
                        ],
                      )
                  ),
                  shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                new Card(
                  color: Colors.grey,
                  child: new ListTile(
                      title: new Text("DEATHS",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      subtitle: new Row(
                        children: <Widget>[
                          new Text(worldData['deaths'].toString(),style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          new Padding(padding: const EdgeInsets.symmetric(horizontal: 60)),
                          new Icon(Icons.arrow_upward,color: Colors.black,),
                          new Text(worldData['todayDeaths'].toString(),style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)
                        ],
                      )
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
                  onPressed:() {},
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