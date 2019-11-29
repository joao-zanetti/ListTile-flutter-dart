/*
    Developed by João Zanetti
    https://github.com/joao-zanetti
*/
import 'package:flutter/material.dart';


class ListtilePage extends StatelessWidget{

  ListtilePage();

  @override
  Widget build(BuildContext context) {
    //value of element of list
    String title="user";
    //you can create one struct for any elements and pass to parameter of createlist (just change the parameter of the function)
    List<MyTile> listOfTiles= _createlist(title,context);
    return Scaffold(
      body: ListView.builder(
      itemCount: listOfTiles.length,
      itemBuilder: (BuildContext context, int index){
        return new StuffInTiles(listOfTiles[index]);
        }
      )
    );
  }
}

class StuffInTiles extends StatelessWidget{

  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {

    return _buildTiles(myTile);
  }

  //FUNCTION THAT CREATES THE FAVORITE USERS LIST
  Widget _buildTiles(MyTile t){
    if (t.children.isEmpty){
      return new ListTile(
        title: new Text(t.title),
        selected: true,
        enabled: true,
        dense: true,
        isThreeLine: false
      );
    }
    return new ExpansionTile(
      key: new PageStorageKey<int>(1),
      title: new Row(children: <Widget>[
          Text(t.title)
        ],),
      children: t.children, 
    );
  }
}

//DEFINE THE ELEMENT OF MATCH USERS LIST
class MyTile{
  String title;
  List<Widget> children;
  MyTile(this.title,[this.children=const <Widget>[]]);
}

//tittle = name of each element from list
//children = widgest  you want to put in each element 
List<MyTile> _createlist(String title,context){
  List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
     title, //name of each element
        <Widget>[
          Row(
            children: <Widget>[
                //widgest  you want to put in each element 
            ],
          )
    ],
  )
  ];
  return listOfTiles;
}

