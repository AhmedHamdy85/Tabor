import 'package:flutter/material.dart';
import 'package:tabor/modules/resiveCode/code.dart';
import 'package:tabor/shared/componants/componant.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var phoneController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                  ),
                  child: SizedBox(
                    height: 24,
                    width: screenWidth * (12 / 390),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 84,
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: screenWidth * (48 / 390),
                    left: screenWidth * (61 / 390),
                  ),
                  width: screenWidth,
                  height: 109,
                  child: DefoltSvgImage(
                      image: 'assets/images/Tabor_Horsintal.svg'),
                ),
                const SizedBox(
                  height: 66,
                ),
                Center(
                  child: specialtext(
                    text: "هل نسيت كلمة المرور؟",
                    fweight: FontWeight.w500,
                    fcolor: const Color(0xff009c7b),
                    talign: TextAlign.center,
                    fsize: 18,
                  ),
                ),
                SizedBox(
                  height: screenHight * 0.018957345971564,
                ),
                Center(
                  child: specialtext(
                    text: 'لا تقلق هذا يحدث ',
                    fcolor: const Color(0xff009c7b),
                    talign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: screenHight * 0.037914691943128,
                ),
                Center(
                  child: defaultFormField2(
                    controller: phoneController,
                    type: TextInputType.number,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'يعم دخل الكود مش ناقصه صداع';
                      }
                      return null;
                    },
                    label: "رقم الهاتف",
                    fcolor: const Color(0xff161616),
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmit: (value) {
                      print(value);
                    },
                    width: screenWidth,
                  ),
                ),
                SizedBox(
                  height: screenHight * 0.037914691943128,
                ),
                Center(
                  child: defaultMateriaButton(
                    width: screenWidth * (326 / 390),
                    height: 48,
                    radius: 8,
                    fsize: 18,
                    backgroundColor: const Color(0xff009c7b),
                    fweight: FontWeight.w500,
                    fcolor: const Color(0xffffffff),
                    text: "تأكيد",
                    function: (() {
                      print(phoneController);
                      NavigateTo(context, const CodeWidget());
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
