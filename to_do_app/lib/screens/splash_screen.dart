// 앱 진입시 로딩 화면. 그동안 로그인 정보 불러오고 이때 정보 있으면 lsit screen으로, 정보 없으면 loginscreen으로 이동
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] is Login: " + isLogin.toString());
    return isLogin;
  }

//initState
  @override
  void initState() {
    // TODO: implement initState(): 위젯 빌드되고 바로 실행되는 초기 실행 메소드
    super.initState();
    Timer(Duration(second:2), (){ //2초 내에 moveScreen() 동작 선언
      moveScreen();
    });
  }

  void moveScreen() async {
    await checkLogin().then((isLogin){ 
      //shared_prefs와 연동되어 로그인 정보 확인하는 함수. 비동기(async-await)로 구성해 checklogin 수행 후 다음 기능 동작하도록 설정
      // checklogin 실행되어 값 받은 후 수행해야 하는 일은 then으로 선언
      if (isLogin){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
         (context) => ListScreen()));
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
        (context)=>LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SplashScreen', style: TextStyle(fontSize: 20)),
            Text('나만의 일정 관리: Todo 리스트 앱', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),

    );
  }
}