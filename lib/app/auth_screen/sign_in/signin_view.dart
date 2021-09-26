import 'package:flutter/material.dart';
import 'package:flutter_test_ui/app/auth_screen/sign_in/signin_viewmodel.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:flutter_test_ui/constants/size_config.dart';
import 'package:flutter_test_ui/utils/helpers/helpers.dart';
import 'package:flutter_test_ui/utils/helpers/regex.dart';
import 'package:flutter_test_ui/widgets/custom_button.dart';
import 'package:flutter_test_ui/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool visiblePassword = false;
  bool _isValidated = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          model.navigateToSignUp();
          return null;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColors.white,
                body: Container(
                  width: kwidth(100, context),
                  height: kheight(100, context),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: kheight(15, context),
                            width: kwidth(50, context),
                            child: Image.asset(
                              'assets/images/top_bck.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: kheight(18, context)),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text('Welcome Back',
                              style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 5,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: kheight(22, context),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kwidth(10, context),
                        ),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                              // margin: EdgeInsets.only(top: kheight(22, context)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: kwidth(4, context)),
                              height: kheight(25, context),
                              width: kwidth(100, context),
                              child: Image.asset(
                                'assets/images/login.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            customYMargin(kheight(1.5, context)),
                            Container(
                              child: Form(
                                key: _key,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                onChanged: () => setState(() => _isValidated =
                                    _key.currentState.validate()),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomTextFormField(
                                      label: "Username",
                                      textInputType: TextInputType.name,
                                      controller: userNameController,
                                      validator: usernameVal,
                                      onChanged: (input) =>
                                          model.setUserName(input),
                                    ),
                                    CustomTextFormField(
                                      label: "Password",
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscured: visiblePassword,
                                      controller: passwordController,
                                      validator: passwordVal,
                                      onChanged: (input) =>
                                          model.setPassword(input),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // customYMargin(kheight(1.5, context)),
                            // InkWell(
                            //   onTap: () {
                            //     showToast(
                            //         'forgot password page is not in the design');
                            //   },
                            //   child: Align(
                            //     alignment: Alignment.center,
                            //     child: Text(
                            //       'Forgot Password',
                            //       style: TextStyle(
                            //           color: Colors.green[300],
                            //           fontWeight: FontWeight.w600,
                            //           fontSize: 12),
                            //     ),
                            //   ),
                            // ),
                            // customYMargin(kheight(3, context)),
                            // CustomButton(
                            //   title: 'Log in',
                            //   height: 7,
                            //   width: kwidth(80, context),
                            //   margin: 1,
                            //   online: true,
                            //   onPressed: () {
                            //     if (_isValidated) {
                            //       model.signIn();
                            //       FocusScope.of(context).unfocus();
                            //       _key.currentState.build(context);
                            //       // userNameController.clear();
                            //       // passwordController.clear();
                            //     } else {
                            //       showToast('fields can\'t be empty');
                            //     }
                            //   },
                            // ),
                            // customYMargin(kwidth(5, context)),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       'Don\'t have an account?',
                            //       style: TextStyle(
                            //           color: Colors.grey, fontSize: 12),
                            //     ),
                            //     customXMargin(3),
                            //     InkWell(
                            //       onTap: () {
                            //         model.navigateToSignUp();
                            //       },
                            //       child: Text(
                            //         'Sign up',
                            //         style: TextStyle(
                            //             color: Colors.green,
                            //             fontWeight: FontWeight.bold,
                            //             fontSize: 12),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            //customYMargin(3)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: kheight(71, context)),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                showToast(
                                    'forgot password page is not in the design');
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.green[300],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            customYMargin(kheight(2.5, context)),
                            CustomButton(
                              title: 'Log in',
                              height: 7,
                              width: kwidth(80, context),
                              margin: 1,
                              online: true,
                              onPressed: () {
                                if (_isValidated) {
                                  model.signIn();
                                  FocusScope.of(context).unfocus();
                                  _key.currentState.build(context);
                                  // userNameController.clear();
                                  // passwordController.clear();
                                } else {
                                  showToast('fields can\'t be empty');
                                }
                              },
                            ),
                            customYMargin(kwidth(5, context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                customXMargin(3),
                                InkWell(
                                  onTap: () {
                                    model.navigateToSignUp();
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
