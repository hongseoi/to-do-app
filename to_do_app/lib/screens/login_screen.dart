import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/screens/list_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  //로그인 설정
  Future setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true); //shareprefs의 islogin을 true로 입력
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width*0.85,
          child: ElevatedButton(
            onPressed: (){
              setLogin().then((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ListScreen()));
              });
            },
            child: Text('로그인'),
          ),
        ),
      ),

    );
  }
}