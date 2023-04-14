import 'package:flutter/material.dart';
import 'package:tabor/shared/componants/componant.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameControlar = TextEditingController();
  TextEditingController phoneControlar = TextEditingController();

  TextEditingController passwordControlar = TextEditingController();

  bool isCheked = false;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 60,
                  left: 20,
                  right: screenWidth - 44,
                ),
                child: Container(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
              ),
              SizedBox(
                height: 84,
              ),
              Center(
                child: DefoltSvgImage(
                  image: 'assets/images/Tabor_Horsintal.svg',
                  width: MediaQuery.of(context).size.width - 109,
                  hight: 109,
                  //c: Color(0xff028c6b)
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: 32, right: 32),
                  width: screenWidth - 64,
                  height: 87,
                  child: Center(
                    child: text(
                        text: "مرحباََ",
                        fsize: 28,
                        fweight: FontWeight.w500,
                        fcolor: const Color(0xff009c7b)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32, left: 32, bottom: 16),
                child: defaultFormField2(
                  width: screenWidth,
                  controller: nameControlar,
                  type: TextInputType.name,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادحال البيانات ';
                    }
                  },
                  label: "الاسم",
                  fcolor: Color(0xff161616),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32, left: 32),
                child: defaultFormField2(
                  width: screenWidth,
                  controller: phoneControlar,
                  type: TextInputType.phone,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يجب ادحال البيانات ';
                    }
                  },
                  label: 'رقم الهاتف',
                  fcolor: Color(0xff161616),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 32, left: 32, top: 16, bottom: 64),
                child: defaultFormField2(
                    width: screenWidth,
                    controller: passwordControlar,
                    type: TextInputType.visiblePassword,
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    suffixPressed: (() {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }),
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يجب ادحال البيانات ';
                      }
                    },
                    label: ' كلمة المرور',
                    fcolor: Color(0xff161616),
                    isPassword: isPassword),
              ),
              SizedBox(
                height: 64,
              ),
              Center(
                child: MaterialButton(
                  color: Color(0xff009c7b),
                  minWidth: MediaQuery.of(context).size.width - 64,
                  height: 48,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
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
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.20000000298023224,
                      child: Container(
                          width: 70,
                          height: 2,
                          decoration:
                              BoxDecoration(color: const Color(0xff161616))),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Opacity(
                      opacity: 0.699999988079071,
                      child: Text("او التسجيل بأستخدام",
                          style: const TextStyle(
                              color: const Color(0xff161616),
                              fontWeight: FontWeight.w400,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Opacity(
                      opacity: 0.20000000298023224,
                      child: Container(
                          width: 70,
                          height: 2,
                          decoration:
                              BoxDecoration(color: const Color(0xff161616))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefoltSvgImage(
                      image: 'assets/images/facbook.svg',
                      width: 35.8,
                      hight: 35.8),
                  SizedBox(
                    width: 61,
                  ),
                  DefoltSvgImage(
                      image: 'assets/images/Googel.svg',
                      width: 35.8,
                      hight: 35.8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
