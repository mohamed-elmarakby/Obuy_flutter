import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obuy/complain.dart';
import 'package:obuy/myPoints.dart';
import 'package:obuy/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  icon: IconButton(
                    icon: Icon(FontAwesomeIcons.listAlt),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Complain()),
                      );
                    },
                    color: basicTheme().primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        body: _selectedIndex == 0 ? MainMenuList() : Delivery(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('الرئيسية'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.motorcycle),
              title: Text('التوصيل'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: basicTheme().primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class MainMenuList extends StatefulWidget {
  @override
  _MainMenuListState createState() => _MainMenuListState();
}

class _MainMenuListState extends State<MainMenuList> {
  bool click1 = true, click2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPoints()),
                );
              },
              child: PointsWidget()),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'المتاجر',
                style: basicTheme()
                    .textTheme
                    .display1
                    .apply(color: Colors.black, fontSizeFactor: 1.5),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        click1 = true;
                        click2 = false;
                        setState(() {});
                      },
                      child: TypeOfMenu(
                        image: 'assets/images/restaurant.png',
                        number: ' ' + listRestaurants.length.toString(),
                        clicked: click1,
                        type: 'مطعم',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        click1 = false;
                        click2 = true;
                        setState(() {});
                      },
                      child: TypeOfMenu(
                        image: 'assets/images/supermarket.png',
                        number: ' ' + listSupermarkets.length.toString(),
                        clicked: click2,
                        type: 'سوبرماركت',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          click1 == true
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listRestaurants[index];
                  },
                  itemCount: listRestaurants.length,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listSupermarkets[index];
                  },
                  itemCount: listSupermarkets.length,
                )
        ],
      ),
    );
  }
}

class PointsWidget extends StatelessWidget {
  const PointsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Card(
              elevation: 4,
              color: basicTheme().primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9, height: 250),
            ),
          ),
          Positioned(
            top: 10,
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                  child: InsideStack(
                    cardNumber: 'BS - 987',
                    numberOfBusiness: '2',
                    restaurantImageUrl: 'assets/images/chicken.png',
                    restaurantPoints: '10',
                    totalPoints: '1500',
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 250),
            ),
          ),
        ],
      ),
    );
  }
}

List<ListItem> listSupermarkets = [
  ListItem(
    type: 'سوبرماركت',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
    famousImage: 'assets/images/mat3am.png',
  ),
  ListItem(
    type: 'سوبرماركت',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
    famousImage: 'assets/images/mat3am.png',
  ),
];
List<ListItem> listRestaurants = [
  ListItem(
    type: 'مطعم',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
  ),
  ListItem(
    type: 'مطعم',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
    famousImage: 'assets/images/mat3am.png',
  ),
  ListItem(
    type: 'مطعم',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
  ),
  ListItem(
    type: 'مطعم',
    name: 'تشك تشكن Chickchicken',
    slogan: 'هدفنا ارضاء الجميع .... وسننجح ان شاء الله',
    brandImage: 'assets/images/chicken.png',
    famousImage: 'assets/images/mat3am.png',
  ),
];

class ListItem extends StatelessWidget {
  final String brandImage, name, slogan, type;
  String famousImage;
  ListItem(
      {this.famousImage, this.brandImage, this.type, this.name, this.slogan});

  @override
  Widget build(BuildContext context) {
    return famousImage != null
        ? Container(
            height: 280,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          famousImage,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                height: 50,
                                width: 50,
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
                                Text(
                                  slogan,
                                  style: TextStyle(color: Color(0xFFA29B9B)),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            height: 150,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                height: 50,
                                width: 50,
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
                                Text(
                                  slogan,
                                  style: TextStyle(color: Color(0xFFA29B9B)),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class TypeOfMenu extends StatelessWidget {
  final String image, type, number;
  final bool clicked;
  TypeOfMenu({this.image, this.number, this.type, this.clicked = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                image,
                scale: 2,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    type,
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(color: Colors.black, fontSizeFactor: 1.2),
                  ),
                  RichText(
                      text: TextSpan(
                          text: number + ' ',
                          style: basicTheme()
                              .textTheme
                              .title
                              .apply(color: basicTheme().primaryColor),
                          children: <TextSpan>[
                        TextSpan(
                          text: 'مشترك',
                          style: basicTheme()
                              .textTheme
                              .title
                              .apply(color: Color(0xFFB4ACAC)),
                        )
                      ])),
                ],
              )
            ],
          ),
          clicked
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 5,
                    color: basicTheme().primaryColor,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

// class RestaurantInPoints extends StatefulWidget {
//   final String restaurantImageUrl;
//   String restaurantPoints;
//   RestaurantInPoints({this.restaurantPoints, this.restaurantImageUrl});
//   @override
//   _RestaurantInPointsState createState() => _RestaurantInPointsState();
// }

// class _RestaurantInPointsState extends State<RestaurantInPoints> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 4,
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               elevation: 4,
//               child: Image.asset(
//                 widget.restaurantImageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     (widget.restaurantPoints == null ||
//                             widget.restaurantPoints == '')
//                         ? '0'
//                         : widget.restaurantPoints,
//                     style: basicTheme().textTheme.display1.apply(
//                         color: basicTheme().primaryColor, fontSizeFactor: 2.5),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'نقطة',
//                     style: basicTheme()
//                         .textTheme
//                         .display1
//                         .apply(color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class InsideStack extends StatefulWidget {
  final String restaurantPoints,
      restaurantImageUrl,
      totalPoints,
      numberOfBusiness,
      cardNumber;
  InsideStack(
      {this.numberOfBusiness,
      this.restaurantImageUrl,
      this.cardNumber,
      this.restaurantPoints,
      this.totalPoints});
  @override
  _InsideStackState createState() => _InsideStackState();
}

class _InsideStackState extends State<InsideStack> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return listRestaurants[index];
                    },
                    itemCount: listRestaurants.length,
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'رقم البطاقة',
                          textAlign: TextAlign.right,
                          style: basicTheme()
                              .textTheme
                              .display1
                              .apply(color: Colors.black, fontSizeFactor: 1.25),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.cardNumber,
                            style: basicTheme().textTheme.display1.apply(
                                color: Colors.black, fontSizeFactor: 1.5),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          textScaleFactor: 1.1,
                          text: TextSpan(
                              text: 'لديك ',
                              style: TextStyle(
                                fontFamily: 'ObuyFont',
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.totalPoints + ' ',
                                  style: TextStyle(
                                    fontFamily: 'ObuyFont',
                                    color: basicTheme().primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'لدي ',
                                  style: TextStyle(
                                    fontFamily: 'ObuyFont',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.numberOfBusiness + ' ',
                                  style: TextStyle(
                                    fontFamily: 'ObuyFont',
                                    color: basicTheme().primaryColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'نشاط تجاري ',
                                  style: TextStyle(
                                    fontFamily: 'ObuyFont',
                                    color: Colors.black,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          flex: 4,
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                'assets/images/points.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  bool click1 = true, click2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'التوصيل الي',
                style: basicTheme()
                    .textTheme
                    .display1
                    .apply(color: Colors.black, fontSizeFactor: 1.5),
              ),
            ),
          ),
          Container(
            child: DropdownButton<String>(
              hint: Text('اختار مكان التوصيل'),
              items: <String>[
                'دجلة بالمز ,  السادس من اكتوبر',
                'مدينة نصر',
                'عبده باشا',
                'العباسية'
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'المتاجر',
                style: basicTheme()
                    .textTheme
                    .display1
                    .apply(color: Colors.black, fontSizeFactor: 1.5),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        click1 = true;
                        click2 = false;
                        setState(() {});
                      },
                      child: TypeOfMenu(
                        image: 'assets/images/restaurant.png',
                        number: '12',
                        clicked: click1,
                        type: 'مطعم',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        click1 = false;
                        click2 = true;
                        setState(() {});
                      },
                      child: TypeOfMenu(
                        image: 'assets/images/supermarket.png',
                        number: ' 20',
                        clicked: click2,
                        type: 'سوبرماركت',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          click1 == true
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listRestaurants[index];
                  },
                  itemCount: listRestaurants.length,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return listSupermarkets[index];
                  },
                  itemCount: listSupermarkets.length,
                )
        ],
      ),
    );
  }
}
