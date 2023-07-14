import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/queue/cubit/queue_logic.dart';
import 'package:tabor/modules/requirement/requirement.dart';
import 'package:tabor/modules/showTecket/showTecket.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';
import 'dart:ui' as UI;

UI.TextDirection direction = UI.TextDirection.rtl;

class FormScheduling extends StatefulWidget {
  FormScheduling(
      {super.key,
      required this.bankName,
      required this.branshName,
      required this.queueName});
  final String branshName;
  final String queueName;
  final String bankName;

  @override
  State<FormScheduling> createState() => _FormSchedulingState();
}

class _FormSchedulingState extends State<FormScheduling> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TimeOfDay timeDay = const TimeOfDay(hour: 11, minute: 30);
  DateTime date = DateTime.now();
  void showTimeOfPicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        timeDay = value!;
      });
    });
  }

  void showDateOfPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        date = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var queueCubit = QueueCubit.get(context);
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Directionality(
        textDirection: direction,
        child: BlocProvider(
          create: (BuildContext context) => layoutCubit(),
          child: BlocConsumer<layoutCubit, layoutStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: screenHight * 0.17,
                      width: double.infinity,
                      decoration: const BoxDecoration(
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
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                specialtext(
                                    text: 'الفيوم-فرع الجامعة',
                                    fsize: 18,
                                    fweight: FontWeight.w600),
                                const SizedBox(
                                  height: 8,
                                ),
                                Opacity(
                                  opacity: 0.5,
                                  child: specialtext(
                                    text: "طابور خدمة العملاء",
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              backgroundColor: const Color(0xffbceee3),
                              child: InkWell(
                                  onTap: () {
                                    NavigateAndFinsh(
                                        context,
                                        Directionality(
                                            textDirection: direction,
                                            child: const layoutScreen()));
                                  },
                                  child: const Icon(Icons.close)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 16, start: 16, bottom: 16, end: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                specialtext(
                                  text: 'الوقت و التاريخ',
                                  fcolor: const Color(0xff7d7d7d),
                                  fweight: FontWeight.w500,
                                  fsize: 18,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: const EdgeInsetsDirectional.all(16),
                                  width: double.infinity,
                                  height: 144,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ContainerPicker(
                                          text: DateFormat.yMMMd()
                                              .format(date)
                                              .toString(),
                                          icon: Iconsax.calendar_tick,
                                          function: showDateOfPicker),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ContainerPicker(
                                          text: timeDay
                                              .format(context)
                                              .toString(),
                                          icon: Iconsax.clock,
                                          function: showTimeOfPicker),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                specialtext(
                                  text: 'المعلومات الخاصه بك',
                                  fweight: FontWeight.w500,
                                  fsize: 18,
                                  fcolor: const Color(0xff7d7d7d),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 16, end: 16, top: 8),
                                  width: double.infinity,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MixedText(text1: 'رقم الهاتف'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      defaultFormFieldReservation(
                                          fcolor: const Color(0xff161616),
                                          hintText: 'ادخل رقم الهاتف',
                                          controller: phoneController,
                                          type: TextInputType.phone,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الرجاء ادخال رقم هاتف صحيح';
                                            }
                                            return null;
                                          },
                                          width: double.infinity),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      MixedText(text1: 'الاسم'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      defaultFormFieldReservation(
                                          fcolor: const Color(0xff161616),
                                          hintText: 'اادخل ااسمك',
                                          controller: nameController,
                                          type: TextInputType.name,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الرجاء ادخال اسما صحيحا';
                                            }
                                            return null;
                                          },
                                          width: double.infinity),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      MixedText(text1: 'الرقم القومي'),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      defaultFormFieldReservation(
                                          fcolor: const Color(0xff161616),
                                          hintText: "ادخل الرقم القومي",
                                          controller: nationalIDController,
                                          type: TextInputType.number,
                                          validate: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'الرجاء ادخال رقم قومي صحيح';
                                            }
                                            return null;
                                          },
                                          width: double.infinity),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    buttonCardBottom(
                        space: (16 / 390) * screenWidth,
                        widthCard: (158 / 390) * screenWidth,
                        function1: () {
                          animatedDialog(
                              context: context,
                              width: screenWidth,
                              screen: ShowTecketScreen(
                                  model: queueCubit.createModel,
                                  bankName: widget.bankName,
                                  branchName: widget.bankName,
                                  queueName: widget.queueName));
                        },
                        text1: ' حجز الدور',
                        image1: 'assets/images/vuesax_bold_ticket_expired.svg',
                        function2: () {
                          NavigateTo(
                              context,
                              Directionality(
                                  textDirection: direction,
                                  child: const RequirementScreen()));
                        },
                        text2: ' المطلوب',
                        image2: 'assets/images/vuesax_bold_info_circle.svg'),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
