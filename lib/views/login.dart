import 'package:flutter/material.dart';
import 'package:kooha_test/core/constants/routes_names.dart';
import 'package:kooha_test/core/constants/styles.dart';
import 'package:kooha_test/core/viewModels/login__vm.dart';
import 'package:stacked/stacked.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String? _email;
    String? _password;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF141414),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF333333),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: const Color(0xFF141414),
              ),
              child: const Icon(Icons.arrow_back),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              height: 39,
              width: 200,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF333333),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Switch to Create account',
                    style: GlobalStyles.size14.copyWith(
                      color: const Color(0xFFAA7105),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [],
      ),
      body: ViewModelBuilder<LoginViewModel>.reactive(
          viewModelBuilder: () => LoginViewModel(),
          builder: (context, model, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24,
                  top: 32.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 174,
                          height: 32,
                          child: Text(
                            'Welcome Back!',
                            style: GlobalStyles.size24.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Be ready to use Kooha in less than 2min ⚡️',
                          style: GlobalStyles.size10.copyWith(
                            color: GlobalStyles.secondaryColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomFormField(
                      formTitle: 'Email address',
                      onChanged: (v) {
                        _email = v;
                      },
                      formHintText: 'john@email.com',
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                    CustomFormField(
                      formHintText: 'Password (min. of 8 characters)',
                      obscureText: true,
                      onChanged: (v) {
                        _password = v;
                      },
                      formTitle: 'Password',
                    ),
                    const SizedBox(
                      height: 266,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 111.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Forgot Password?',
                            style: GlobalStyles.size10.copyWith(
                              color: GlobalStyles.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Reset it',
                            style: GlobalStyles.size14.copyWith(
                              color: const Color(0xFFF8A80D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    SizedBox(
                      height: 62,
                      width: 341,
                      child: ElevatedButton(
                        onPressed: () async {
                          bool isSuccess =
                              await model.loginUser(_email, _password);
                          if (isSuccess) {
                            Navigator.pushNamed(context, browsePage);
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF5D1700),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Log me In',
                            style: GlobalStyles.size10,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required this.formHintText,
    this.obscureText = false,
    required this.formTitle,
    this.onChanged,
  }) : super(key: key);
  final String formTitle;
  final String? formHintText;
  final Function(String? v)? onChanged;
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formTitle,
          style: GlobalStyles.size14,
        ),
        const SizedBox(
          height: 4.0,
        ),
        SizedBox(
          width: 342,
          child: TextFormField(
            style: GlobalStyles.size14,
            onChanged: onChanged,
            obscureText: obscureText,
            cursorColor: const Color(0xFFAA7105),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF141414),
              hintText: formHintText,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Color(0xFF333333),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color(0xFFAA7105),
                ),
              ),
              hintStyle: GlobalStyles.size10.copyWith(
                color: GlobalStyles.secondaryColor,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Color(0xFF333333),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
