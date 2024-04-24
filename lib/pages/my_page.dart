import 'dart:io';

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    var lastPopTime;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        final now = DateTime.now();
        if (lastPopTime == null ||
            now.difference(lastPopTime) > const Duration(seconds: 2)) {
          lastPopTime = now;
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('뒤로 버튼을 한번 더 누르면 앱이 종료됩니다.'),
            ),
          );
          return;
        } else {
          // 두 번 연속으로 뒤로가기 버튼을 누르면 앱 종료
          exit(0);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("로고", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
              Text("마이페이지 서비스는", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
              Text("준비중입니다.", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
              SizedBox(height: 30,),
              Text("빠른 시간 안에 만나요:D", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
              SizedBox(height: MediaQuery.sizeOf(context).height*0.1,),
              Text("문의사항", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
              Text("contact@kapitalletter.com", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14,decoration: TextDecoration.underline),),
            ],
          ),
        ),
      ),
    );
  }
}
