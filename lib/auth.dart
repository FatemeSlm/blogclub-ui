import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/home.dart';
import 'package:blogclub/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const loginTab = 0;
  static const signUpTab = 1;
  int selectedTabIndex = loginTab;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabtextStyle = TextStyle(
        fontSize: 16,
        color: themeData.colorScheme.onPrimary,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Assets.img.icons.logo.svg(width: 90),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      color: themeData.colorScheme.primary,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: (){
                                   setState(() {
                                      selectedTabIndex = loginTab;
                                   });
                                  },
                                  child: Text(
                                    'Login'.toUpperCase(),
                                    style: tabtextStyle.apply(
                                      color: selectedTabIndex== loginTab ? Colors.white : Colors.white54
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){
                                    setState(() {
                                      selectedTabIndex = signUpTab;
                                    });
                                  },
                                  child: Text(
                                    'Sign Up'.toUpperCase(),
                                    style: tabtextStyle.apply(
                                      color: selectedTabIndex == signUpTab ? Colors.white : Colors.white54),
                                  ),
                                )
                              ]),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: themeData.colorScheme.surface,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(32),
                                    topRight: Radius.circular(32))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 40, 32, 32),
                                child: selectedTabIndex == loginTab ? _Login(themeData: themeData) : _SignUp(themeData: themeData),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome back', style: themeData.textTheme.headline4),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Sign in with your account',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 55)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const MainScreen()));
            },
            child: Text('Login'.toUpperCase())),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forget your password?'),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Reset here'),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
            child: Text(
          'or sign in with'.toUpperCase(),
          style: const TextStyle(letterSpacing: 2),
        )),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32)
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome to blog club', style: themeData.textTheme.headline4),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Please enter your information',
          style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(
          height: 16,
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Fullname')),
        ),
        const TextField(
          decoration: InputDecoration(label: Text('Username')),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.of(context).size.width, 55)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: Text('Sign up'.toUpperCase())),
        const SizedBox(
          height: 32,
        ),
        Center(
            child: Text(
          'or sign up with'.toUpperCase(),
          style: const TextStyle(letterSpacing: 2),
        )),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32)
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text('Password'),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? 'Show' : 'Hide',
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.primary),
              ))),
    );
  }
}
