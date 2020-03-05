import 'package:flutter/material.dart';
import 'package:obuy/myPoints.dart';
import 'package:obuy/theme.dart';

class PointsConfirmation extends StatelessWidget {
  final int place;
  PointsConfirmation({this.place});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/obuy_logo_orange.png',
                  fit: BoxFit.cover,
                  height: 50.0,
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.all(5.0),
                icon: Icon(
                  Icons.arrow_forward,
                  color: basicTheme().primaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Hero(
          tag: 'pointsDiscount',
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: <Widget>[
              
              Center(
                  child: Container(
                child: pointsDiscount[place],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    'لاستبدال النقاط يجب الذهاب الي المتجر',
                    style: basicTheme()
                        .textTheme
                        .title
                        .apply(color: Color(0xFFA29B9B)),
                  ),
                ),
              ),
              Center(
                child: Text(
                  ' و اظهار كود الخصم للكاشير',
                  style: basicTheme()
                      .textTheme
                      .title
                      .apply(color: Color(0xFFA29B9B)),
                ),
              )
            ],
          )),
    ));
  }
}
