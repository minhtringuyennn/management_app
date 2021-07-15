import 'package:flutter/material.dart';
import 'package:management_app/data/user.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';

const Color LightBlue = Color.fromRGBO(8, 49, 91, 1);
const Color DarkBlue = Color.fromRGBO(6, 52, 110, 1);

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? data;

  Future<String> getJson() async {
    var _jsonData = await http.get(
      Uri.parse(
        'http://www.json-generator.com/api/json/get/ceBDtBbvDm?indent=2',
      ),
    );
    return _jsonData.body;
  }

  void _getUser() async {
    String _jsonData = await getJson();
    Map<String, dynamic> _data = json.decode(_jsonData);
    User user = User.fromJson(_data);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => data = user);
    print('done fetching');
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? _loadScreen()
          : Column(
              children: <Widget>[
                //Build user info
                Stack(
                  children: <Widget>[
                    //Build Info Background
                    buildBackGround(),
                    //Build Info Card
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [buildUserInfo(), buildAvatar(), userStat()],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }

  Container buildUserInfo() {
    return Container(
      margin: EdgeInsets.only(top: 130),
      constraints: BoxConstraints.expand(width: 350, height: 200),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15.0,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
          ),
          Positioned(
            top: 70,
            child: Container(
              child: Text(
                data!.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildAvatar() {
    return Positioned(
      top: 73,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: CircleAvatar(
          radius: 57,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(data!.picture),
        ),
      ),
    );
  }

  Positioned userStat() {
    return Positioned(
      top: 245,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Quản lí công",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "${data!.curStat}/${data!.maxStat}",
                    style: TextStyle(
                      color: Colors.pink.shade500,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Số phép đã dùng",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "0${data!.hasAbsent}",
                    style: TextStyle(
                      color: Colors.pink.shade500,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Số phép còn lại",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "0${data!.maxAbsent - data!.hasAbsent}",
                    style: TextStyle(
                      color: Colors.pink.shade500,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildBackGround() {
    return Container(
      padding: EdgeInsets.all(40),
      constraints: BoxConstraints.expand(height: 200),
      decoration: BoxDecoration(
        gradient: new LinearGradient(
            colors: [LightBlue, DarkBlue],
            begin: const FractionalOffset(1.0, 1.0),
            end: const FractionalOffset(0.2, 0.2),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
    );
  }

  Container _loadScreen() {
    return Container(
      child: Center(
        child: LoadingBouncingGrid.square(
          backgroundColor: DarkBlue,
          borderColor: DarkBlue,
          duration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
