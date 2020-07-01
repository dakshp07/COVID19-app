import 'package:flutter/material.dart';

class Search extends SearchDelegate{
  final List CountryList;
  Search({this.CountryList});
  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
    );
  }
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return
      IconButton(icon:Icon(Icons.arrow_back) , onPressed: (){
        Navigator.pop(context);
      });

  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? CountryList : CountryList.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
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
                  new Text(suggestionList[index]['country'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  new Image.network(suggestionList[index]['countryInfo']['flag'],height: 50,width: 60,),
                ],
              ),
              new Column(
                children: <Widget>[
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("CONFIRMED: "+suggestionList[index]['cases'].toString(),style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.red,size: 15,),
                      new Text(suggestionList[index]['todayCases'].toString(),style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("ACTIVE: "+suggestionList[index]['active'].toString(),style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("RECOVERED: "+suggestionList[index]['recovered'].toString(),style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.green,size: 15,),
                      new Text(suggestionList[index]['todayRecovered'].toString(),style: TextStyle(fontSize: 15,color: Colors.green,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: <Widget>[
                      new Text("DEATHS: "+suggestionList[index]['deaths'].toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                      new Padding(padding: const EdgeInsets.symmetric(horizontal: 10)),
                      new Icon(Icons.arrow_upward,color: Colors.black,size: 15,),
                      new Text(suggestionList[index]['todayDeaths'].toString(),style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(bottom: 10)),
                ],
              )
            ],
          ),
        )
    );
  }
}