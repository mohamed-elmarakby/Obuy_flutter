import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:obuy/login.dart';
import 'package:obuy/mainPage.dart';
import 'package:obuy/theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers of textFormFields
  TextEditingController email, mobilePhone, password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: basicTheme().primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //put logo here
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                  ),
                  Container(
                    child: Image.asset('assets/images/obuy_logo_white.png'),
                    width: 178,
                    height: 148,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                  ),
                  Text('اطلب .. جمع نقط .. تابع العروض',
                      textAlign: TextAlign.center,
                      style: basicTheme().textTheme.display1.apply(
                            fontSizeFactor: 1,
                          )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'التسجيل',
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(fontSizeFactor: 1.5),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ObuyFormField(
                  controllerName: email,
                  inputType: TextInputType.emailAddress,
                  labelText: 'البريد الالكتروني',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ObuyFormField(
                  controllerName: mobilePhone,
                  inputType: TextInputType.phone,
                  labelText: 'رقم الموبايل',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ObuyFormField(
                  controllerName: password,
                  secure: true,
                  labelText: 'كلمة المرور',
                  inputType: TextInputType.visiblePassword,
                ),
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: basicTheme().accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  },
                  child: Text(
                    'تسجيل',
                    style: basicTheme()
                        .textTheme
                        .display2
                        .apply(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  color: basicTheme().accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'تسجيل الدخول بواسطة فيس بوك',
                          style: basicTheme()
                              .textTheme
                              .display2
                              .apply(color: Colors.black),
                        ),
                      ),
                      CircleAvatar(
                        child: Icon(FontAwesomeIcons.facebookF),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         backgroundColor: Color(0xFFFDB000),
//         body: Padding(
//           padding: const EdgeInsets.all(26.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                         flex: 1,
//                         child: HeaderObuy(
//                           logoPath: 'assets/images/obuy_logo_white.png',
//                           titleColor: 0xFFFFFFFF,
//                         )),
//                     Align(
//                         alignment: Alignment.centerRight,
//                         child: Text(
//                           'التسجيل',
//                           style: basicTheme()
//                               .textTheme
//                               .display1
//                               .apply(fontSizeFactor: 1.5),
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: ObuyFormField(
//                         controllerName: email,
//                         inputType: TextInputType.emailAddress,
//                         labelText: 'البريد الالكتروني',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 16.0),
//                       child: ObuyFormField(
//                         controllerName: email,
//                         inputType: TextInputType.phone,
//                         labelText: 'رقم الموبايل',
//                       ),
//                     ),
//                     ObuyFormField(
//                       controllerName: password,
//                       secure: true,
//                       labelText: 'كلمة المرور',
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 55,
//                       width: MediaQuery.of(context).size.width,
//                       child: RaisedButton(
//                         color: basicTheme().accentColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.0))),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegisterPage()),
//                           );
//                         },
//                         child: Text(
//                           'تسجيل',
//                           style: basicTheme()
//                               .textTheme
//                               .display2
//                               .apply(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       height: 55,
//                       width: MediaQuery.of(context).size.width,
//                       child: RaisedButton(
//                         color: basicTheme().accentColor,
//                         shape: RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(5.0))),
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Padding(
//                               padding: EdgeInsets.only(left: 8.0),
//                               child: Text(
//                                 'تسجيل الدخول بواسطة فيس بوك',
//                                 style: basicTheme()
//                                     .textTheme
//                                     .display2
//                                     .apply(color: Colors.black),
//                               ),
//                             ),
//                             CircleAvatar(
//                               child: Icon(FontAwesomeIcons.facebookF),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: SizedBox(),
//                       flex: 1,
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );



class HeaderObuy extends StatelessWidget {
  final int titleColor;
  final String logoPath;
  HeaderObuy(
      {this.titleColor = 0xFFFFFF,
      this.logoPath = 'assets/images/obuy_logo_orange.png'});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //put logo here
        Expanded(flex: 5, child: Image.asset(logoPath)),
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 3,
          child: Text('اطلب .. جمع نقط .. تابع العروض',
              textAlign: TextAlign.center,
              style: basicTheme()
                  .textTheme
                  .display1
                  .apply(fontSizeFactor: 1, color: Color(titleColor))),
        )
      ],
    );
  }
}
