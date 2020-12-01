import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget{
  final String username;
  final String password;
  // wajib diisi
  HomePage({Key key,this.username,this.password}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Home Screen'),
        ),
      ),
      body: Center(
        child: ListView(
            padding: EdgeInsets.only(top: 50.0),
            children: <Widget>[
              Container(
              child: Center(
                  child:
                    Text("Hello "+username,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: Center(
                  child:
                  Text("Password anda : "+password,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),)
                ),
              ),
            ]
        ),
      ),
    ); // This trailin
  }
}