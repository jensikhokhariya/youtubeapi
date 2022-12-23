import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtubeapi/screen/home/home_screen.dart';
import 'package:youtubeapi/screen/provider/lrprovider.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  TextEditingController e1 = TextEditingController();
  TextEditingController p1 = TextEditingController();
  LProvider hprovider = LProvider();
  SharedPreferences? logindata;
  bool? newuser;
  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home_Page()));
    }
  }
  @override
  void dispose() {
    e1.dispose();
    p1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: e1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("E-mail"),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: p1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("password"),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  String username = e1.text;
                  String password = p1.text;
                  if (username != '' && password != '') {
                    print('Successfull');
                    logindata?.setBool('login', false);
                    logindata?.setString('username', username);
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Text("Log in"),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  hprovider.googleSignIn();
                },
                child: Image.asset("assets/images/google.png"),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'res');
                },
                child: Text("create account | Sign in",style: TextStyle(color: Colors.red),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}