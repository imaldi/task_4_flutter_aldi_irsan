import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Beginner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 5, 30, 30),
        child: Center(
          child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: usernameController,
                // validator: (String value) {
                //   if (value.isEmpty) {
                //     return "Email Harus Diisi";
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                // validator: (String value) {
                //   if (value.isEmpty) {
                //     return "Password tidak boleh kosong";
                //   }
                //   return null;
                // },
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("LOGIN"),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    if(usernameController.text == "admin" && passwordController.text == "admin"){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage(username : usernameController.text, password : passwordController.text))
                      );
                    } else if(usernameController.text == ""){
                      Fluttertoast.showToast(
                          msg: "Username harus diisi",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else if(passwordController.text == ""){
                      Fluttertoast.showToast(
                          msg: "Password harus diisi",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else if(passwordController.text.length < 5){
                      Fluttertoast.showToast(
                          msg: "Password tidak boleh kurang dari 5",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Password atau Username Salah",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
