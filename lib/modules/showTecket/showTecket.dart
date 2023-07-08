import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/Home/map/mapscreen.dart';
import 'package:tabor/modules/queue/cubit/queue_logic.dart';
import 'package:tabor/shared/componants/componant.dart';

import '../../model/create_tecit_model.dart';

class ShowTecketScreen extends StatelessWidget {
  ShowTecketScreen(
      {super.key,
      required this.model,
      required this.bankName,
      required this.branchName,
      required this.queueName});
  CreateTecitModel model;
  String bankName;
  String branchName;
  String queueName;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double containrwidth = screenWidth - 64;
    var queueCubit = QueueCubit.get(context);
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              height: screenHight * 0.17,
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
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    specialtext(
                      text: 'التذكرة',
                      fsize: 21,
                      fweight: FontWeight.w600,
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Color(0xffbceee3),
                      child: InkWell(
                          onTap: () {
                            NavigateAndFinsh(
                                context,
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: layoutScreen()));
                          },
                          child: Icon(
                            Icons.close,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 0)
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 32, left: 32, top: 16, bottom: 32),
                  child: SvgPicture.asset(
                    'assets/images/Big_tecket.svg',
                    height: 376,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, left: 16, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                                child: Image.asset(
                                    'assets/images/Rectangle 1.png')),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                specialtext(
                                  text: bankName,
                                  fweight: FontWeight.w500,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: specialtext(
                                      text: branchName,
                                      fweight: FontWeight.w500,
                                      fsize: 12),
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: specialtext(
                                    text: queueName,
                                    fsize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenWidth * 0.052,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Container(
                          width: screenWidth * 0.75,
                          height: 376 * 0.12,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff19161616))),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            child: Row(
                              children: [
                                specialtext(
                                    text: "العدد فى الانتظار",
                                    fweight: FontWeight.w500,
                                    fsize: 18),
                                SizedBox(
                                  width: screenWidth * 0.22,
                                ),
                                specialtext(
                                  text: '${model.numOfWaitings}',
                                  fweight: FontWeight.w500,
                                  fsize: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 376 * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            specialtext(
                              text: "الوقت المتبقى",
                              fweight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: screenWidth * 0.38,
                            ),
                            timeRemain(
                              hours: queueCubit.parsedTime['hours'] ?? 0,
                              munets: queueCubit.parsedTime['minutes'] ?? 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: linearIndicator(
                          width: containrwidth - 32,
                          hours: queueCubit.parsedTime['hours'] ?? 0,
                          munets: queueCubit.parsedTime['minutes'] ?? 0,
                        ),
                      ),
                      SizedBox(
                        height: 85,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: specialtext(
                          text: "رقم الدور",
                          fweight: FontWeight.w500,
                        ),
                      ),
                      specialtext(
                          text: "C-002", fsize: 41, fweight: FontWeight.w500),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      NavigateTo(
                          context,
                          Directionality(
                              textDirection: TextDirection.rtl,
                              child: MapHome()));
                    },
                    child: Container(
                      width: screenWidth * 0.39,
                      height: 52,
                      decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              blurRadius: 4,
                            ),
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/Frame 70.png'),
                          SizedBox(
                            width: 8,
                          ),
                          specialtext(
                            text: "الذهاب للموقع",
                            fweight: FontWeight.w500,
                            fsize: 16,
                            fcolor: const Color(0xff1a73e8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: InkWell(
                      onTap: () {
                        animatedDialog(
                            context: context,
                            width: screenWidth,
                            text1: 'رجوع',
                            text2: 'الغاء التذكرة',
                            title: 'هل تريد الغاء تذكرتك ؟',
                            massege:
                                'عند تكرار الغاء التذكرة سيتم حذرك من استخدام خدماتنا',
                            animation: 'question',
                            screen: layoutScreen(),
                            color: Color(0xffE11A1A));
                      },
                      child: Container(
                        width: screenWidth * 0.39,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Color(0xff161616),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Color(0xffffffff),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            specialtext(
                              text: " الغاء التذكرة",
                              fsize: 16,
                              fweight: FontWeight.w500,
                              fcolor: const Color(0xffffffff),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            navigationButton(
              text: "القائمة الرئسية",
              function: () {
                NavigateAndFinsh(
                    context,
                    const Directionality(
                        textDirection: TextDirection.rtl,
                        child: layoutScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
