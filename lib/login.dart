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
  TextEditingController email, password;
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
                  controllerName: password,
                  secure: true,
                  labelText: 'كلمة المرور',
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
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'تسجيل الدخول',
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
