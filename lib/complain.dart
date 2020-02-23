import 'package:flutter/material.dart';
import 'package:obuy/theme.dart';

class Complain extends StatefulWidget {
  @override
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  TextEditingController complainString;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Container(
                        height: 80,
                        child: Image.asset(
                          'assets/images/chicken.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'تشك تشكن ChickChicken',
                        style: basicTheme()
                            .textTheme
                            .display2
                            .apply(color: Colors.black),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF10027),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'مطعم',
                          style: basicTheme().textTheme.title,
                        ),
                      ),
                      Container(
                        child: Text(
                          'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
                          style: basicTheme()
                              .textTheme
                              .body1
                              .apply(color: Color(0xFFA29B9B)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/newsletter.png',
            fit: BoxFit.fill,
          ),
          Center(
              child: Text(
            'شكوي / اقتراح',
            style: basicTheme().textTheme.display1.apply(color: Colors.black),
          )),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration:
                    InputDecoration(hintText: "اكتبلنا شكوتك/اقتراحك هنا"),
                controller: complainString,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: basicTheme().primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                onPressed: () {},
                child: Text(
                  'إرسال',
                  style: basicTheme()
                      .textTheme
                      .display2
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
