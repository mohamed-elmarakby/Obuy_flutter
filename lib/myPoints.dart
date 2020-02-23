import 'package:flutter/material.dart';
import 'package:obuy/theme.dart';

class MyPoints extends StatefulWidget {
  @override
  _MyPointsState createState() => _MyPointsState();
}

class _MyPointsState extends State<MyPoints> {
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
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'نقاطي',
                style: basicTheme()
                    .textTheme
                    .display1
                    .apply(color: Colors.black, fontSizeFactor: 1.5),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantPoints(whichOne: index)),
                    );
                  },
                  child: availablePoints[index]);
            },
            itemCount: availablePoints.length,
          )
        ],
      ),
    ));
  }
}

List<PointsList> availablePoints = [
  PointsList(
    type: 'مطعم',
    name: 'تشك تشكن Chickchicken',
    points: '495',
    brandImage: 'assets/images/chicken.png',
  ),
];

class PointsList extends StatelessWidget {
  final String brandImage, points, name, type;
  PointsList({this.brandImage, this.name, this.points, this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 4,
                            child: Container(
                              height: 65,
                              width: 65,
                              child: Image.asset(
                                brandImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                name,
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
                                  type,
                                  style: basicTheme().textTheme.title,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/points.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantPoints extends StatefulWidget {
  final int whichOne;
  RestaurantPoints({this.whichOne});
  @override
  _RestaurantPointsState createState() => _RestaurantPointsState();
}

class _RestaurantPointsState extends State<RestaurantPoints> {
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
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 4,
                                  child: Container(
                                    height: 65,
                                    width: 65,
                                    child: Image.asset(
                                      availablePoints[widget.whichOne]
                                          .brandImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      availablePoints[widget.whichOne].name,
                                      style: basicTheme()
                                          .textTheme
                                          .display2
                                          .apply(color: Colors.black),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF10027),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        availablePoints[widget.whichOne].type,
                                        style: basicTheme().textTheme.title,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/images/points.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'تبديل النقاط',
                          textAlign: TextAlign.right,
                          style: basicTheme()
                              .textTheme
                              .display1
                              .apply(color: Colors.black, fontSizeFactor: 1.5),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'رقم البطاقة',
                          textAlign: TextAlign.right,
                          style: basicTheme()
                              .textTheme
                              .display1
                              .apply(color: Colors.black, fontSizeFactor: 1),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'BS - 987',
                            style: basicTheme()
                                .textTheme
                                .display1
                                .apply(color: Colors.black, fontSizeFactor: 1),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Card(
                      child: PointsNumber(points: 400),
                    ))
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Discounts(
                    title: 'خصم 10%',
                    subtitle: 'احصل علي خصم 10% علي طلباتك',
                    numberOfPoints: 120),
                Discounts(
                    title: 'خصم 40%',
                    subtitle: 'احصل علي خصم 40% علي طلباتك',
                    numberOfPoints: 350),
                Discounts(
                    title: 'وجبة عائلية',
                    subtitle: 'احصل علي وجبة عائلية مجانية',
                    numberOfPoints: 550),
                Discounts(
                    title: 'وجبة عائلية',
                    subtitle: 'احصل علي وجبة عائلية مجانية',
                    numberOfPoints: 550),
                Discounts(
                    title: 'مشتريات بقيمة 200 ج',
                    subtitle: 'مشتريات من تشك تشكن بقيمة 200 جنيه',
                    numberOfPoints: 1200),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class Discounts extends StatelessWidget {
  final int numberOfPoints;
  final String title, subtitle;
  Discounts({this.numberOfPoints, this.title = '', this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 130,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 8.0),
                                    child: Text(
                                      title,
                                      style: basicTheme()
                                          .textTheme
                                          .display1
                                          .apply(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        subtitle,
                                        textAlign: TextAlign.right,
                                        style: basicTheme()
                                            .textTheme
                                            .title
                                            .apply(color: Color(0xFF746F6F)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                numberOfPoints.toString(),
                                textAlign: TextAlign.right,
                                style: basicTheme().textTheme.display1.apply(
                                    color: basicTheme().primaryColor,
                                    fontSizeFactor: 1.5),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'نقطة',
                                  textAlign: TextAlign.left,
                                  style: basicTheme().textTheme.title.apply(
                                      color: Colors.black, fontSizeFactor: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              'assets/images/points.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          bottom: 3,
          child: Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.85,
              color: basicTheme().primaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class PointsNumber extends StatelessWidget {
  final int points;
  PointsNumber({this.points});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              Text(
                points.toString(),
                textAlign: TextAlign.right,
                style: basicTheme().textTheme.display1.apply(
                    color: basicTheme().primaryColor, fontSizeFactor: 1.5),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'نقطة',
                  textAlign: TextAlign.left,
                  style: basicTheme()
                      .textTheme
                      .display1
                      .apply(color: Colors.black, fontSizeFactor: 1),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Image.asset('assets/images/points.png'),
        )
      ],
    );
  }
}
