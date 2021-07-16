import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const titleText = TextStyle(fontSize: 11, color: Colors.black);
var buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    fixedSize: MaterialStateProperty.all(Size.square(70)));

const Color LightBlue = Color.fromRGBO(8, 49, 91, 1);
const Color DarkBlue = Color.fromRGBO(6, 52, 110, 1);

final slideList = [
  GridView.count(
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
    crossAxisCount: 4,
    padding: EdgeInsets.all(4.0),
    physics: new NeverScrollableScrollPhysics(),
    children: [
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.solidCalendarTimes, color: DarkBlue),
            SizedBox(height: 5),
            Text('Xin nghỉ', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.users, color: DarkBlue),
            SizedBox(height: 5),
            Text('Đặt phòng họp', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.truckPickup, color: DarkBlue),
            SizedBox(height: 5),
            Text('Chuyển phát nhanh',
                textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.clipboardList, color: DarkBlue),
            SizedBox(height: 5),
            Text('Bảng công', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.bus, color: DarkBlue),
            SizedBox(height: 5),
            Text('Đặt xe đưa đón',
                textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.planeDeparture, color: DarkBlue),
            SizedBox(height: 5),
            Text('Điều động công tác',
                textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.baby, color: DarkBlue),
            SizedBox(height: 5),
            Text('Chế độ con nhỏ',
                textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.clock, color: DarkBlue),
            SizedBox(height: 5),
            Text('Làm thêm giờ', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      )
    ],
  ),
  GridView.count(
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
    crossAxisCount: 4,
    padding: EdgeInsets.all(4.0),
    physics: new NeverScrollableScrollPhysics(),
    children: [
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.taxi, color: DarkBlue),
            SizedBox(height: 5),
            Text('Tài xế', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.briefcaseMedical, color: DarkBlue),
            SizedBox(height: 5),
            Text('Khai báo y tế', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.fileInvoiceDollar, color: DarkBlue),
            SizedBox(height: 5),
            Text('Bảng lương', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.clipboardCheck, color: DarkBlue),
            SizedBox(height: 5),
            Text('Phê duyệt', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.solidCalendarAlt, color: DarkBlue),
            SizedBox(height: 5),
            Text('Xin nghỉ theo giờ',
                textAlign: TextAlign.center, style: titleText)
          ],
        ),
      ),
      TextButton(
        onPressed: () {},
        style: buttonStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.listOl, color: DarkBlue),
            SizedBox(height: 5),
            Text('Nhắc nhở', textAlign: TextAlign.center, style: titleText)
          ],
        ),
      )
    ],
  ),
];
