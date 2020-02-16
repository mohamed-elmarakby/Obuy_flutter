import 'package:flutter/material.dart';
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
        backgroundColor: Color(0xFFFDB000),
        body: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: <Widget>[
              Expanded(flex: 1, child: HeaderObuy()),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'التسجيل',
                    style: basicTheme()
                        .textTheme
                        .display1
                        .apply(fontSizeFactor: 1.5),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    ObuyFormField(
                      controllerName: email,
                      inputType: TextInputType.emailAddress,
                      labelText: 'البريد الالكتروني',
                    ),
                    ObuyFormField(
                      controllerName: mobilePhone,
                      inputType: TextInputType.phone,
                      labelText: 'رقم الموبايل',
                    ),
                    ObuyFormField(
                      controllerName: password,
                      secure: true,
                      labelText: 'كلمة المرور',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
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
                            'تسجيل',
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
                                child: Icon(Icons.face),
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

class HeaderObuy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //put logo here
        Expanded(flex: 1, child: Icon(Icons.ac_unit)),
        Expanded(
            flex: 1,
            child: Text('اطلب .. جمع نقط .. تابع العروض',
                style:
                    basicTheme().textTheme.display1.apply(fontSizeFactor: 1.5)))
      ],
    );
  }
}
