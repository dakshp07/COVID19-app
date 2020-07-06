import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search.dart';

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
          IconButton(icon: new Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Search(CountryList:countryData));
          })
        ],
      ),
      body: countryData == null ? new Center(
        child: new CircularProgressIndicator(),
      ) :  ListView.builder(
        itemCount: countryData.length,
        itemBuilder: (context , index) =>
        new Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          color: Color(0x000080),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5)),
                  new Text(countryData[index]['country'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  new Image.network(countryData[index]['countryInfo']['flag'],height: 50,width: 60,),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("CONFIRMED: "+countryData[index]['cases'].toString(),style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.red,size: 15,),
                      new Text(countryData[index]['todayCases'].toString(),style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("ACTIVE: "+countryData[index]['active'].toString(),style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("RECOVERED: "+countryData[index]['recovered'].toString(),style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.green,size: 15,),
                      new Text(countryData[index]['todayRecovered'].toString(),style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("DEATHS: "+countryData[index]['deaths'].toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.black,size: 15,),
                      new Text(countryData[index]['todayDeaths'].toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
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
