import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:submission_dicoding/views/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isCanLogin = false;
  bool isVisible = false;

  void checkLogin() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        isCanLogin = true;
      });
    } else {
      setState(() {
        isCanLogin = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.10,
              ),
              Container(
                width: width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Pesona Indonesia',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text('Login to continue',
                        style: TextStyle(
                            fontSize: 22,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SizedBox(height: height*0.1,),
              Container(
                height: height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Mobile-login.jpg'),
                        fit: BoxFit.contain)),
              ),
              SizedBox(height: height*0.07,),
              Container(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          onChanged: (value) => checkLogin(),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'youremail@domain.com',
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          onChanged: (value) => checkLogin(),
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isVisible,
                          decoration: InputDecoration(
                              hintText: 'your password',
                              suffixIcon: IconButton(
                                  onPressed: () => setState(() {
                                        isVisible = !isVisible;
                                      }),
                                  icon: Icon(isVisible
                                      ? Icons.lock
                                      : Icons.lock_open))),
                        )
                      ],
                    ),
                  ],
                ),
                // height: height * 0.2,
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          backgroundColor: MaterialStateProperty.all(
                              isCanLogin ? Colors.red : Colors.grey)),
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                          CupertinoPageRoute(builder: (context) => HomePage()),
                          (route) => false),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 27),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
