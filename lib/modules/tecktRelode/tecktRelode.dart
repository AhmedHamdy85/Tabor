import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';
import '../../model/active_teckit_model/active_teckit_model.dart';
import '../../shared/componants/constants.dart';

class tecketReloudeScreen extends StatelessWidget {
  const tecketReloudeScreen({super.key, required this.model});
  final TeckitModel model;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double containrwidth = screenWidth - 64;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (BuildContext context) => layoutCubit(),
          child: BlocConsumer<layoutCubit, layoutStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
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
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: DefoltSvgImage(
                                      image:
                                          'assets/images/vuesax_bulk_arrow_square_right.svg'),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: specialtext(
                                    text: 'تفاصيل التذكرة',
                                    fsize: 21,
                                    fweight: FontWeight.w500,
                                    fcolor: mainColor),
                              ),
                              Spacer(),
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
                                        Shadow(
                                            color: Colors.black, blurRadius: 0)
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
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16, left: 16, top: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${banksLogo['${model.service!.queue!.branch!.bank!.name}']}'))),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          specialtext(
                                            text:
                                                '${model.service!.queue!.branch!.bank!.name}',
                                            fweight: FontWeight.w500,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: specialtext(
                                                text:
                                                    "${model.service!.queue!.branch!.nameOfBranch}",
                                                fweight: FontWeight.w500,
                                                fsize: 12),
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: specialtext(
                                              text:
                                                  "${model.service!.queue!.nameOfQueue}",
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
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Color(0xff19161616))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Row(
                                        children: [
                                          specialtext(
                                              text: 'الانتظار',
                                              fweight: FontWeight.w500,
                                              fsize: 18),
                                          Spacer(),
                                          specialtext(
                                            text: '${model.waitingTime}',
                                            fweight: FontWeight.w500,
                                            fsize: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          specialtext(
                                              text: " تاريخ التذكرة",
                                              fweight: FontWeight.w500),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          specialtext(
                                            text: "الوقت",
                                            fweight: FontWeight.w500,
                                            fcolor: const Color(0xff7d7d7d),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          specialtext(
                                              text: "2 مارس ,2023",
                                              fweight: FontWeight.w500),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          specialtext(
                                            text: "11:28 AM",
                                            fweight: FontWeight.w500,
                                            fcolor: const Color(0xff7d7d7d),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 43,
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: specialtext(
                                    text: "رقم الدور",
                                    fweight: FontWeight.w500,
                                  ),
                                ),
                                specialtext(
                                    text: "C-000",
                                    fsize: 41,
                                    fweight: FontWeight.w500),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: MaterialButton(
                          color: Color(0xff009c7b),
                          minWidth: double.infinity,
                          height: 52,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {
                            NavigateAndFinsh(
                                context,
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: layoutScreen()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.repeat,
                                  color: const Color(0xffffffff),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                specialtext(
                                    text: 'اعادة الحجز',
                                    fsize: 18,
                                    fweight: FontWeight.w500,
                                    fcolor: const Color(0xffffffff),
                                    talign: TextAlign.center)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
