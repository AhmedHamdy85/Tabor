import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/modules/sinup_screen/cubit/logic.dart';
import 'package:tabor/modules/sinup_screen/cubit/states.dart';
import 'package:tabor/shared/componants/componant.dart';

import '../../layout/layout_screen.dart';
import '../../shared/componants/constants.dart';
import '../../shared/network/local/cashe_helper.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameControlar = TextEditingController();
    TextEditingController phoneControlar = TextEditingController();

    TextEditingController passwordControlar = TextEditingController();
    var formkey = GlobalKey<FormState>();

    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => RegestrCubit(),
      child: BlocConsumer<RegestrCubit, RegesterStates>(
        listener: (context, state) {
          if (state is RegesterSuccesState) {
            showToast(
                text: 'اهلا بك,تم انشاء حسابك بنجاح',
                state: toastStates.SUCCESS);
            CasheHelper.saveData(key: 'id', value: state.regesterModel!.id)
                .then((value) {
              id = state.regesterModel!.id;
              NavigateAndFinsh(
                  context,
                  const Directionality(
                      textDirection: TextDirection.rtl, child: layoutScreen()));
            });
          } else if (state is RegesterErrorState) {
            showToast(
                text:
                    'لم نتمكن من  انشاء حسابك الرجاء التاكد من البيانات المدخلة',
                state: toastStates.ERROR);
          }
        },
        builder: (context, state) {
          var Cubit = RegestrCubit.get(context);
          return Form(
            key: formkey,
            child: Scaffold(
              backgroundColor: const Color(0xfff5f5f5),
              body: SingleChildScrollView(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                      //var Cubit = layoutCubit.get(context);
                      Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 60,
                          left: 20,
                          right: screenWidth - 44,
                        ),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                            alignment: AlignmentDirectional.topEnd,
                          ),
                        ),
                      ),
                      const SizedBox(
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
                          padding: const EdgeInsets.only(left: 32, right: 32),
                          width: screenWidth - 64,
                          height: 87,
                          child: Center(
                            child: specialtext(
                                text: "مرحباََ",
                                fsize: 28,
                                fweight: FontWeight.w500,
                                fcolor: const Color(0xff009c7b)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32, left: 32, bottom: 16),
                        child: defaultFormField2(
                          width: screenWidth,
                          controller: nameControlar,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب ادحال البيانات ';
                            }
                            return null;
                          },
                          label: "الاسم",
                          fcolor: const Color(0xff161616),
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
                            return null;
                          },
                          label: 'رقم الهاتف',
                          fcolor: const Color(0xff161616),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 32, left: 32, top: 16, bottom: 64),
                        child: defaultFormField2(
                            width: screenWidth,
                            controller: passwordControlar,
                            type: TextInputType.visiblePassword,
                            suffix: Cubit.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixPressed: (() {
                              Cubit.changePasswordVisabilty();
                            }),
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'يجب ادحال البيانات ';
                              }
                              return null;
                            },
                            label: ' كلمة المرور',
                            fcolor: const Color(0xff161616),
                            isPassword: Cubit.isPassword),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! RegesterLoadingState,
                          builder: (context) {
                            return MaterialButton(
                              color: const Color(0xff009c7b),
                              minWidth: MediaQuery.of(context).size.width - 70,
                              height: 48,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  Cubit.userRegester(
                                      phoneNumber: phoneControlar.text,
                                      password: passwordControlar.text,
                                      userName: nameControlar.text,
                                      confirmPasword: passwordControlar.text);
                                }
                              },
                              child: const Text(" انشاء حساب",
                                  style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "ReadexPro",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.0),
                                  textAlign: TextAlign.center),
                            );
                          },
                          fallback: (context) =>
                              const CircularProgressIndicator(),
                        ),
                      ),
                      const SizedBox(
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
                                  decoration: const BoxDecoration(
                                      color: Color(0xff161616))),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Opacity(
                              opacity: 0.699999988079071,
                              child: Text("او التسجيل بأستخدام",
                                  style: TextStyle(
                                      color: Color(0xff161616),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ReadexPro",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.center),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Opacity(
                              opacity: 0.20000000298023224,
                              child: Container(
                                  width: 70,
                                  height: 2,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff161616))),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
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
                          const SizedBox(
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
            ),
          );
        },
      ),
    );
  }
}
