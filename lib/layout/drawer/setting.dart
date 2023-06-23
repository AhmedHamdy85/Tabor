import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Setting extends StatelessWidget {
  Setting({super.key});
  void compare;
  @override
  late String name;
  late String phoneNumber;
  late Color saveColor;
  var phoneControlar = TextEditingController();
  var nameControlar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    name = 'نادر سيد';
    phoneNumber = '01125229119';
    saveColor = Color(0xff7d7d7d);
    nameControlar.text = name;
    phoneControlar.text = phoneNumber;
    // bool isTextGreen = (nameController.text != name || phoneController.text != phoneNumber);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: formkey,
        backgroundColor: Color(0xffe9ebeb),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                ],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 24, bottom: 24, top: 54),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: DefoltSvgImage(
                            image: 'assets/images/frame_138.svg'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: specialtext(
                          text: 'المعلومات الشخصية',
                          fsize: 21,
                          talign: TextAlign.right,
                          fweight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if ((nameControlar.text != name ||
                              phoneControlar.text != phoneNumber)) {
                            Navigator.pop(context);
                          }
                        },
                        child: Positioned(
                          left: 0,
                          bottom: 0,
                          child: specialtext(
                            text: 'حفظ',
                            fcolor: (nameControlar.text != name ||
                                    phoneControlar.text != phoneNumber)
                                ? Color(0xff009c7b)
                                : Color(0xff7d7d7d),
                            fsize: 18,
                            fweight: FontWeight.w500,
                            talign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                /*
              SizedBox(height: 8),
               Container(),
                     SizedBox(height: 12,),
                     SizedBox(height: 32,),
                     Spacer(),
               */
                padding: EdgeInsets.all(24),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/unknown.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(

                                      //borderRadius: BorderRadius.all(Radius.circular(16)),
                                      /* image: DecorationImage(
                                  image: AssetImage('assets/images/vuesax_linear_gallery_add.png'),
                                  fit: BoxFit.fill
                                  ),*/
                                      ),
                                  child: Icon(
                                    Icons.add_photo_alternate_rounded,
                                    color: const Color(0xff7d7d7d),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: specialtext(
                                      text: ' تغيير الصورة الشخصية',
                                      fcolor: const Color(0xff7d7d7d),
                                      talign: TextAlign.right,
                                      fsize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          specialtext(
                            text: 'الاسم',
                            fsize: 16,
                            fcolor: Color(0xff7d7d7d),
                            fweight: FontWeight.w400,
                            talign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      defaultFormFieldSetting(
                        width: double.infinity,
                        controller: nameControlar,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء ادخال اسم صحيح';
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          specialtext(
                            text: 'رقم الهاتف',
                            fsize: 16,
                            fcolor: Color(0xff7d7d7d),
                            fweight: FontWeight.w400,
                            talign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      defaultFormFieldSetting(
                        width: double.infinity,
                        controller: phoneControlar,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return ' الرجاء ادخال رقم الهاتف';
                          }
                        },
                        //fsize: 16,
                        //fcolor: Color(0xff161616),
                      ),
                      SizedBox(
                        height: (232 / 844) * screenHight,
                      ),
                      navigationButton(
                        text: 'القائمة الرئيسية',
                        function: () {
                          NavigateTo(
                              context,
                              const Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: layoutScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
