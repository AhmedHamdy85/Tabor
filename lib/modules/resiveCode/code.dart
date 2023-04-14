import 'package:flutter/material.dart';
import 'package:tabor/shared/componants/componant.dart';

class CodeWidget extends StatelessWidget {
  CodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var codeController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 60, right: screenWidth * (356 / 390)),
                  child: Container(
                    height: 24,
                    width: screenWidth * (12 / 390),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                SizedBox(
                  height: 84,
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: screenWidth * (48 / 390),
                    left: screenWidth * (61 / 390),
                  ),
                  width: screenWidth,
                  height: 109,
                  child: DefoltSvgImage(
                      image: 'assets/images/Tabor_Horsintal.svg'),
                ),
                SizedBox(
                  height: screenHight * 0.1196682464454976,
                ),
                Opacity(
                    opacity: .7,
                    child: text(
                      text: "لقد تم ارسال كود تفعيل الى الايميل الخاص بك",
                    )),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: defaultFormField2(
                    width: double.infinity,
                    controller: codeController,
                    type: TextInputType.number,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'يعم دخل الكود مش ناقصه صداع';
                      }
                      return null;
                    },
                    label: 'ادخل الكود المكون من 4 ارقام',
                    fcolor: Color(0xff161616),
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                  ),
                ),
                SizedBox(
                  height: screenHight * 0.028436018957346,
                ),
                Center(
                  child: defaultMateriaButton(
                    width: double.infinity,
                    height: 48,
                    radius: 8,
                    fsize: 18,
                    backgroundColor: Color(0xff009c7b),
                    fweight: FontWeight.w500,
                    fcolor: Color(0xffffffff),
                    text: "تأكيد",
                    function: (() {
                      print(codeController);
                    }),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Opacity(
                  opacity: .7,
                  child: text(
                    text: "الم تستلم الكود ؟",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                defaultTextButton(
                  text: "ارسال مرة اخرى",
                  function: (() {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
