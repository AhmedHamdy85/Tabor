import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/login/cubit/logic.dart';
import 'package:tabor/modules/login/cubit/states.dart';
import 'package:tabor/modules/phoneScreen/phone.dart';
import 'package:tabor/modules/resiveCode/code.dart';
import 'package:tabor/shared/componants/componant.dart';

class logInScreen extends StatelessWidget {
  logInScreen({super.key});
  TextEditingController phoneControlar = TextEditingController();
  TextEditingController passwordControlar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var loginCubit = LoginCubit.get(context);
            return Scaffold(
              backgroundColor: Color(0xfff5f5f5),
              body: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 20),
                        child: Container(
                          height: 24,
                          width: 24,
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
                      Center(
                        child: DefoltSvgImage(
                            image: 'assets/images/Tabor_Horsintal.svg',
                            width: MediaQuery.of(context).size.width - 100,
                            hight: 109),
                      ),
                      SizedBox(
                        height: 61,
                      ),
                      Center(
                        child: specialtext(
                          text: "مرحباََ بعودتك",
                          fsize: 28,
                          talign: TextAlign.center,
                          fweight: FontWeight.w500,
                          fcolor: const Color(0xff009c7b),
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 32, left: 32),
                        child: defaultFormField2(
                            width: double.infinity,
                            controller: phoneControlar,
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return ' الرجاء ادخال رقم الهاتف';
                              }
                            },
                            label: '  رقم الهاتف',
                            fcolor: Color(0xff161616),
                            isPassword: loginCubit.isPassword),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32, left: 32, top: 16, bottom: 20),
                        child: defaultFormField2(
                            width: double.infinity,
                            controller: passwordControlar,
                            type: TextInputType.visiblePassword,
                            suffix: loginCubit.isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            suffixPressed: (() {
                              loginCubit.changePasswordVisabilty();
                            }),
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return ' الرجاء ادخال كلمة المرور';
                              }
                            },
                            label: ' كلمة المرور',
                            fcolor: Color(0xff161616),
                            isPassword: loginCubit.isPassword),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: loginCubit.isChecked,
                            onChanged: (value) {
                              loginCubit.changeCheckBox();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            side: MaterialStateBorderSide.resolveWith(
                                ((states) => BorderSide(
                                      color: Color(0xff009c7b),
                                    ))),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text("تذكرنى",
                                style: const TextStyle(
                                    color: const Color(0xff161616),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ReadexPro",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.right),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          DefoltTextButton(
                              function: () {
                                NavigateTo(context, PhoneScreen());
                              },
                              text: "هل نسيت كلمة المرور؟",
                              direction: TextAlign.left),
                        ],
                      ),
                      SizedBox(
                        height: 61,
                      ),
                      Center(
                        child: MaterialButton(
                          color: Color(0xff009c7b),
                          minWidth: MediaQuery.of(context).size.width - 70,
                          height: 48,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              NavigateAndFinsh(
                                  context,
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: layoutScreen()));
                            }
                          },
                          child: Text(" تسجيل الدخول",
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
                        height: 32,
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
                                  decoration: BoxDecoration(
                                      color: const Color(0xff161616))),
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
                                  decoration: BoxDecoration(
                                      color: const Color(0xff161616))),
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
          },
        ),
      ),
    );
  }
}
