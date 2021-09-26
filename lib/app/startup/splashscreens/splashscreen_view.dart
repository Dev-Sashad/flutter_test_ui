import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_ui/constants/colors.dart';
import 'package:flutter_test_ui/constants/size_config.dart';
import 'package:flutter_test_ui/utils/helpers/helpers.dart';
import 'package:flutter_test_ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'splahscreen_viewmodel.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
          resizeToAvoidBottomInset: false,
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
                padding: EdgeInsets.symmetric(horizontal: kwidth(4, context)),
                height: kheight(35, context),
                width: kwidth(100, context),
                child: Image.asset(
                  'assets/images/splash.png',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: kheight(58, context)),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Discover New Places',
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 5,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold)),
                    customYMargin(kwidth(8, context)),
                    Text('Vulputate vitate',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 5,
                          color: Colors.green[300],
                        )),
                    customYMargin(kwidth(3, context)),
                    Text('enim.Vulputate',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 5,
                          color: Colors.green[300],
                        )),
                    customYMargin(kwidth(3, context)),
                    Text('vitate',
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 5,
                          color: Colors.green[300],
                        )),
                    // customYMargin(kwidth(10, context)),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: kheight(14, context)),
                    child: CustomButton(
                      title: 'GET STARTED',
                      height: 7,
                      width: kwidth(80, context),
                      margin: 1,
                      online: true,
                      onPressed: () {
                        model.navigateToPage();
                      },
                    ),
                  ))
            ],
          )),
    );
  }
}
