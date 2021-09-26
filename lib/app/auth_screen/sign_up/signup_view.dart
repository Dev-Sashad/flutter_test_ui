import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ui/app/auth_screen/sign_up/signup_viewmodel.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:flutter_test_ui/constants/size_config.dart';
import 'package:flutter_test_ui/utils/helpers/helpers.dart';
import 'package:flutter_test_ui/utils/helpers/regex.dart';
import 'package:flutter_test_ui/widgets/custom_button.dart';
import 'package:flutter_test_ui/widgets/custom_text_form_field.dart';
import 'package:stacked/stacked.dart';

class SignUpView extends StatefulWidget {
  final String phoneNumber;
  SignUpView({Key key, this.phoneNumber}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isValidated = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final nameController = TextEditingController();
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () {
          SystemNavigator.pop();
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
                body: Stack(
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
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Welcome Onboard',
                              style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 5,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                          customYMargin(kheight(3, context)),
                          Text('Vulputate vitate enim.Vulputate',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 5,
                                color: Colors.green[300],
                              )),
                          customYMargin(kheight(1, context)),
                          Text('vitate enim',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 5,
                                color: Colors.green[300],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: kheight(35, context),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: kwidth(10, context),
                      ),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Container(
                            child: Form(
                              key: _key,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: () => setState(() =>
                                  _isValidated = _key.currentState.validate()),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  customYMargin(2),
                                  CustomTextFormField(
                                    label: "Name",
                                    textInputType: TextInputType.name,
                                    controller: nameController,
                                    validator: nameVal,
                                    onChanged: (input) => model.setName(input),
                                  ),
                                  CustomTextFormField(
                                    label: "Email",
                                    textInputType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: emailVal,
                                    onChanged: (input) => model.setEmail(input),
                                  ),
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
                          // customYMargin(kwidth(10, context)),
                          // CustomButton(
                          //   title: 'Register',
                          //   height: 7,
                          //   width: kwidth(80, context),
                          //   margin: 1,
                          //   online: true,
                          //   onPressed: () async {
                          //     if (_isValidated == true) {
                          //       await model.onSignUp(context);
                          //       FocusScope.of(context).unfocus();
                          //       // nameController.clear();
                          //       // emailController.clear();
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
                          //       'Already have an account?',
                          //       style:
                          //           TextStyle(color: Colors.grey, fontSize: 12),
                          //     ),
                          //     customXMargin(3),
                          //     InkWell(
                          //       onTap: () {
                          //         model.navigateToSignIn();
                          //       },
                          //       child: Text(
                          //         'Sign in',
                          //         style: TextStyle(
                          //             color: Colors.green,
                          //             fontSize: 12,
                          //             fontWeight: FontWeight.w700),
                          //       ),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: kheight(75, context)),
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomButton(
                                title: 'Register',
                                height: 7,
                                width: kwidth(80, context),
                                margin: 1,
                                online: true,
                                onPressed: () async {
                                  if (_isValidated == true) {
                                    await model.onSignUp(context);
                                    FocusScope.of(context).unfocus();
                                    // nameController.clear();
                                    // emailController.clear();
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
                                    'Already have an account?',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  customXMargin(3),
                                  InkWell(
                                    onTap: () {
                                      model.navigateToSignIn();
                                    },
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              )
                            ]))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
