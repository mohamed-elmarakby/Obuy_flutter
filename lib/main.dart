import 'package:flutter/material.dart';
import 'package:obuy/register.dart';
import 'package:obuy/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      underImageTitle: 'اطلب',
      underImageSubtitle: 'اطلب كل اللي تحبه من بيتك',
    ),
    Page(
      underImageTitle: 'تابع العروض',
      underImageSubtitle: 'انت مش زي الكل ليك عروض مخصوصة ليك',
    ),
    Page(
      underImageTitle: 'جمع نقاط',
      underImageSubtitle:
          'جمع نقاطك علي كل المشتريات و استبدلهم بهدايا و خصومات',
    ),
    Page(
      underImageTitle: 'عندك شكوي',
      underImageSubtitle: 'لو عندك شكوي او اقتراح هنوصلهالك ',
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
          Expanded(flex: 3, child: FlutterLogo()),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      underImageTitle,
                      style: basicTheme()
                          .textTheme
                          .display1
                          .apply(color: Color(0xFFFDB000), fontSizeFactor: 2.5),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    underImageSubtitle,
                    softWrap: true,
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 1,
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
                            onPressed: () {},
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
