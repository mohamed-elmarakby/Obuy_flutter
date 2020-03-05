import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obuy/login.dart';
import 'package:obuy/register.dart';
import 'package:obuy/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'OBUY',
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child,
        );
      },
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<Widget> pages = [
    Page(
      imageUrl: 'assets/images/motorcycle.png',
      underImageTitle: 'اطلب',
      underImageSubtitle: 'اطلب كل اللي تحبه من بيتك',
    ),
    Page(
      imageUrl: 'assets/images/discount.png',
      underImageTitle: 'تابع العروض',
      underImageSubtitle: 'انت مش زي الكل ليك عروض مخصوصة ليك',
    ),
    Page(
      imageUrl: 'assets/images/gift.png',
      underImageTitle: 'جمع نقاط',
      underImageSubtitle:
          'جمع نقاطك علي كل المشتريات و استبدلهم بهدايا و خصومات',
    ),
    Page(
      imageUrl: 'assets/images/newsletter.png',
      underImageTitle: 'عندك شكوي',
      underImageSubtitle: 'لو عندك شكوي او اقتراح هنوصلهالك',
      lastPage: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: SafeArea(
            child: Scaffold(
                body: PageView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: pages.length,
                    itemBuilder: (context, itemCount) {
                      return pages[itemCount];
                    }))));
  }
}

class Page extends StatelessWidget {
  final String underImageTitle, underImageSubtitle, imageUrl;
  final bool lastPage;
  Page(
      {this.imageUrl,
      this.underImageSubtitle,
      this.underImageTitle,
      this.lastPage = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: HeaderObuy(
              titleColor: 0xFFFDB000,
            ),
          ),
          Expanded(flex: 3, child: Image.asset(imageUrl)),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    underImageTitle,
                    textAlign: TextAlign.right,
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(color: Color(0xFFFDB000), fontSizeFactor: 2.5),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        underImageSubtitle,
                        textAlign: TextAlign.right,
                        style: basicTheme()
                            .textTheme
                            .display1
                            .apply(color: Colors.black, fontSizeFactor: 1.2),
                      ),
                    ),
                  ),
                ),
                lastPage
                    ? Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            color: basicTheme().primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text(
                              'الاشتراك',
                              style: basicTheme()
                                  .textTheme
                                  .display1
                                  .apply(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
