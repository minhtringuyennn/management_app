import 'package:flutter/material.dart';
import 'package:management_app/data/user.dart';
import 'package:management_app/data/slide.dart';
import 'package:management_app/widget/dots.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loading_animations/loading_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_image/flutter_image.dart';

const Color LightBlue = Color.fromRGBO(8, 49, 91, 1);
const Color DarkBlue = Color.fromRGBO(6, 52, 110, 1);

class HomeScreen extends StatefulWidget {
  const HomeScreen();
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  User? data;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  Future<String> getJson() async {
    var _jsonData = await http.get(
      Uri.parse(
        'http://www.json-generator.com/api/json/get/cevQSBOYoi?indent=2',
      ),
    );
    return _jsonData.body;
  }

  void _getUser() async {
    String _jsonData = await getJson();
    Map<String, dynamic> _data = json.decode(_jsonData);
    User user = User.fromJson(_data);
    await Future.delayed(const Duration(milliseconds: 150));
    setStateIfMounted(() => data = user);
    print('done fetching');
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? _loadScreen()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Positioned(
                      top: 80,
                      right: 15,
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.cog,
                          color: Colors.white,
                          size: 25,
                        ),
                        onPressed: () => print('Pressed Setting'),
                      ),
                    )
                  ],
                ),
                //ScrollView
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: [
                        //Title "Ưa thích" section
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            "Ưa thích",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //List view "Ưa thích" section
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 200,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) =>
                                setState(() => _currentPage = index),
                            children: slideList,
                          ),
                        ),

                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                i == _currentPage
                                    ? SlideDots(true)
                                    : SlideDots(false)
                            ],
                          ),
                        ),

                        //Recent activities sections
                        Container(
                          padding: EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            "Hoạt động gần đây",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data!.activities.length,
                          itemBuilder: (context, index) {
                            return buildActivity(index);
                          },
                        ),
                      ],
                    ),
                  ),
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
          backgroundImage: NetworkImageWithRetry(data!.picture),
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

  Container buildActivity(int index) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Center(
        child: Container(
          width: 360,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child:
                    Icon(FontAwesomeIcons.bullhorn, color: DarkBlue, size: 30),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Tên: ${data!.activities[index].type}',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: DarkBlue,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Hình thức: ${data!.activities[index].description}',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${data!.activities[index].date}/${data!.activities[index].month}/${data!.activities[index].year}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
