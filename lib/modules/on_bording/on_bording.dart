import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/login/login_screen.dart';
import 'package:tabor/modules/sinup_screen/sinUpScreen.dart';
import 'package:tabor/shared/componants/componant.dart';

class onBoardingScreen extends StatelessWidget {
  const onBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
          ),
          InkWell(
            onTap: () {
              NavigateTo(
                  context,
                  Directionality(
                      textDirection: TextDirection.rtl, child: layoutScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.38,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff161616)),
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'تخطى',
                    style: TextStyle(
                        color: const Color(0xff161616),
                        fontWeight: FontWeight.w500,
                        fontFamily: "ReadexPro",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 131,
          ),
          Center(
            child: DefoltSvgImage(
                image: 'assets/images/Tabor_logo.svg',
                width: MediaQuery.of(context).size.width - 103,
                hight: 283),
          ),
          SizedBox(
            height: 98,
          ),
          Center(
            child: DefoltButon(),
          ),
          SizedBox(
            height: 21,
          ),
          Center(
            child: MaterialButton(
              color: Color(0xffd1ede7),
              minWidth: MediaQuery.of(context).size.width - 70,
              height: 48,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {
                NavigateTo(context, logInScreen());
              },
              child: Text("تسجيل الدخول",
                  style: const TextStyle(
                      color: const Color(0xff161616),
                      fontWeight: FontWeight.w500,
                      fontFamily: "ReadexPro",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.0),
                  textAlign: TextAlign.center),
            ),
          )
        ],
      ),
    );
  }
}

class DefoltButon extends StatelessWidget {
  const DefoltButon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Color(0xff009c7b),
      minWidth: MediaQuery.of(context).size.width - 70,
      height: 48,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {
        NavigateTo(context, SignUpScreen());
      },
      child: Text("انشاء حساب",
          style: const TextStyle(
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
          textAlign: TextAlign.center),
    );
  }
}

class DefoltImage extends StatelessWidget {
  const DefoltImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        'assets/images/Tabor_logo.svg',
        width: 205,
        height: 283,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }
}
