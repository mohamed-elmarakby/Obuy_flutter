import 'package:flutter/material.dart';
import 'package:obuy/register.dart';
import 'package:obuy/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers of textFormFields
  TextEditingController email, mobilePhone, password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFDB000),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: HeaderObuy(
                    logoPath: 'assets/images/obuy_logo_white.png',
                    titleColor: 0xFFFFFFFF,
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'الدخول',
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(fontSizeFactor: 1.5),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: ObuyFormField(
                        controllerName: email,
                        inputType: TextInputType.emailAddress,
                        labelText: 'البريد الالكتروني',
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: ObuyFormField(
                        controllerName: password,
                        secure: true,
                        labelText: 'كلمة المرور',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      //normal login button
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: basicTheme().accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          onPressed: () {},
                          child: Text(
                            'تسجيل الدخول',
                            style: basicTheme()
                                .textTheme
                                .display2
                                .apply(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      //facebook login button
                      flex: 2,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: basicTheme().accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
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
                    ),
                    Expanded(flex: 3, child: SizedBox()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ObuyFormField extends StatelessWidget {
  final String labelText;
  final TextInputType inputType;
  final TextEditingController controllerName;
  final bool secure;
  ObuyFormField(
      {this.inputType,
      this.labelText,
      this.controllerName,
      this.secure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secure,
      controller: controllerName,
      keyboardType: inputType,
      style: basicTheme().textTheme.body1.apply(),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: labelText,
          labelStyle: basicTheme().textTheme.body1),
    );
  }
}
