import 'package:flutter/material.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/Home/map/mapscreen.dart';
import 'package:tabor/modules/showTecket/showTecket.dart';
import 'package:tabor/modules/tecktRelode/tecktRelode.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:flutter/rendering.dart';
import 'package:tabor/model/active_teckit_model/active_teckit_model.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';
import 'package:tabor/modules/queue/queue.dart';

class TecketScrren extends StatelessWidget {
  const TecketScrren({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double containrwidth = screenWidth - 64;
    double cotanrhigt = screenHight * 0.45;
    return BlocConsumer<layoutCubit, layoutStates>(
      listener: (context, state) {},
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
              screenWidth: screenWidth,
              text: 'التذاكر' '    ',
              context: context),
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Opacity(
                        opacity: 0.699999988079071,
                        child: specialtext(
                            text: "تذاكر نشطة",
                            fsize: 21,
                            fweight: FontWeight.w500),
                      ),
                    ),
                    ConditionalBuilder(
                        condition: state is! GetActiveTeckitLoadingState,
                        builder: (context) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  layoutCubit.get(context).activeTeckit.length,
                              itemBuilder: (context, index) => Center(
                                child: ActiveTeckt(
                                    model: layoutCubit
                                        .get(context)
                                        .activeTeckit[index],
                                    screenWidth: screenWidth,
                                    screenHight: screenHight,
                                    cotanrhigt: cotanrhigt,
                                    containrwidth: containrwidth),
                              ),
                            ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator())),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Opacity(
                        opacity: 0.699999988079071,
                        child: specialtext(
                            text: "تذاكر سابقة",
                            fsize: 21,
                            fweight: FontWeight.w500),
                      ),
                    ),
                    ConditionalBuilder(
                        condition: state is! GetCompletedTeckitLoadingState,
                        builder: (context) => ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: layoutCubit
                                  .get(context)
                                  .completedTeckit
                                  .length,
                              itemBuilder: (context, index) => Center(
                                child: InActiveTeckt(
                                  screenWidth: screenWidth,
                                  model: layoutCubit
                                      .get(context)
                                      .completedTeckit[index],
                                ),
                              ),
                            ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator())),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InActiveTeckt extends StatelessWidget {
  const InActiveTeckt({
    super.key,
    required this.screenWidth,
    required this.model,
  });

  final double screenWidth;
  final TeckitModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          NavigateTo(context, tecketReloudeScreen());
        },
        child: Container(
          width: screenWidth - 40,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000),
                )
              ],
              color: const Color(0xffffffff)),
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Row(children: [
              Center(child: DefoltSvgImage(image: 'assets/images/Googel.svg')),
              SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    specialtext(
                      text: "${model.service!.queue!.branch!.bank!.name}",
                      fweight: FontWeight.w500,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: specialtext(
                          text:
                              "${model.service!.queue!.branch!.nameOfBranch} ",
                          fsize: 12,
                          fweight: FontWeight.w500),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: specialtext(
                          text: "${model.service!.queue!.nameOfQueue}",
                          fsize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color(0xffE9EBEB),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                  ),
                  SizedBox(
                    height: 50,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                            direction: Axis.vertical,
                            children: List.generate(
                                (5),
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Container(
                                        width: 3,
                                        height: 6,
                                        color: Color(0xffE9EBEB),
                                      ),
                                    )));
                      },
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Color(0xffE9EBEB),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    NavigateTo(context, tecketReloudeScreen());
                  },
                  icon: Icon(
                    Iconsax.repeat5,
                    size: 32,
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

class ActiveTeckt extends StatelessWidget {
  const ActiveTeckt({
    super.key,
    required this.screenWidth,
    required this.screenHight,
    required this.cotanrhigt,
    required this.containrwidth,
    required this.model,
  });

  final TeckitModel model;
  final double screenWidth;
  final double screenHight;
  final double cotanrhigt;
  final double containrwidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth - 64,
        height: screenHight * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // boxShadow: [
            //   BoxShadow(
            //       color: const Color(0xff40000000),
            //       offset: Offset(0, 0),
            //       spreadRadius: 0)
            // ],
            color: const Color(0xffffffff)),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
              child: Row(
                children: [
                  Center(
                      child: DefoltSvgImage(image: 'assets/images/Googel.svg')),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      specialtext(
                          text: '${model.service!.queue!.branch!.bank!.name}',
                          fweight: FontWeight.w500),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: specialtext(
                            text:
                                "${model.service!.queue!.branch!.nameOfBranch}",
                            fsize: 12,
                            fweight: FontWeight.w500),
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: specialtext(
                            text: '${model.service!.queue!.nameOfQueue}',
                            fsize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(11),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xff40000000), blurRadius: 4),
                          ]),
                      child: InkWell(
                          onTap: () {
                            NavigateTo(context, MapHome());
                          },
                          child: Image.asset('assets/images/Frame 70.png')),
                    ),
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
                            screen: const layoutScreen(),
                            color: const Color(0xffE11A1A));
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff161616),
                        ),
                        child: Icon(
                          Icons.close,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: cotanrhigt * 0.06,
            ),
            Center(
              child: Container(
                width: screenWidth * 0.75,
                height: cotanrhigt * 0.12,
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
                          fsize: 18,
                          fweight: FontWeight.w500),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: cotanrhigt * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                children: [
                  specialtext(
                    text: "الوقت المتبقى",
                    fweight: FontWeight.w500,
                  ),
                  const Spacer(),
                  timeRemain(),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: linearIndicator(width: containrwidth - 32),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  width: 25,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color(0xffE9EBEB),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                ),
                SizedBox(
                  width: containrwidth - 50,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                          direction: Axis.horizontal,
                          children: List.generate(
                              (constraints.constrainWidth() / 13).floor(),
                              (index) => Text(
                                    '-',
                                    style: TextStyle(
                                        color: Color(0xffE9EBEB), fontSize: 30),
                                  )));
                    },
                  ),
                ),
                Container(
                  width: 25,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color(0xffE9EBEB),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
              ],
            ),
            Opacity(
              opacity: 0.5,
              child: specialtext(
                text: "رقم الدور",
                fweight: FontWeight.w500,
              ),
            ),
            specialtext(text: "C-002", fweight: FontWeight.w500, fsize: 41),
          ],
        ),
      ),
    );
  }
}
