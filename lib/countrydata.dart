import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryData extends StatefulWidget {
  @override
  _CountryDataState createState() => _CountryDataState();
}

class _CountryDataState extends State<CountryData> {

  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get("https://www.disease.sh/v2/countries");
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }


  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Country Stats",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        actions: <Widget>[
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
          new Icon(Icons.search),
        ],
      ),
      body: ListView.builder(
          itemCount: countryData.length,
          itemBuilder: (context , index) =>
          new Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Color(0x000080),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5)),
                    new Text(countryData[index]['country'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    new Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new Text("CONFIRMED: "+countryData[index]['cases'].toString(),style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new Text("ACTIVE: "+countryData[index]['active'].toString(),style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new Text("RECOVERED: "+countryData[index]['recovered'].toString(),style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                    new Padding(padding: const EdgeInsets.only(top: 10)),
                    new Text("DEATHS: "+countryData[index]['deaths'].toString(),style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    new Padding(padding: const EdgeInsets.only(bottom: 10)),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
