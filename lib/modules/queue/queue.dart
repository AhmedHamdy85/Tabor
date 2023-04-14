import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:tabor/modules/service/service.dart';
import 'package:tabor/modules/sinup_screen/sinUpScreen.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class QueuesScreen extends StatefulWidget {
  const QueuesScreen({super.key});

  @override
  State<QueuesScreen> createState() => _QueuesScreenState();
}

class _QueuesScreenState extends State<QueuesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    final List<String> items = [
      'السبت                             8 صباحا - 6 مساء',
      'الاحد                                8 صباحا - 6 مساء',
      'الاثنين                              8 صباحا - 6 مساء',
      'الثلاثاء                              8 صباحا - 6 مساء',
      'الاربعاء                             8 صباحا - 6 مساء',
      'الخميس                          8 صباحا - 6 مساء',
    ];
    String? selectedValue;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar2(
              context: context,
              screenHight: screenHight,
              screenWidth: screenWidth,
              text: 'السابق'),
          Image.network(
            'https://www.bankygate.com/UserFiles/News/2021/04/05/19740.jpg?210405152916',
            width: screenWidth,
            height: 192,
            fit: BoxFit.cover,
          ),
          /*DefoltSvgImage(image: 'assets/images/ٌRectangle7.svg',
          width: screenWidth,
          hight: screenHight*0.578,
          ),*/
          Container(
            width: screenWidth,
            height: 83,
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xff40000000))],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
            ),
            padding: EdgeInsets.only(right: 16, left: 16, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(backgroundColor: Colors.green, radius: 6),
                    SizedBox(
                      height: 3,
                    ),
                    text(
                      text: "مفتوح",
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    text(
                      text: "الفيوم - فرع الجامعة",
                      fweight: FontWeight.w600,
                      fsize: 21,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Opacity(
                          opacity: .5,
                          child: text(
                            text: "كم",
                            fweight: FontWeight.w500,
                            fsize: 16,
                          ),
                        ),
                        Opacity(
                          opacity: .5,
                          child: text(
                            text: "8",
                            fweight: FontWeight.w500,
                            fsize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Opacity(
              opacity: .2,
              child: Container(
                width: screenWidth - 31,
                height: 2,
                decoration: BoxDecoration(color: const Color(0xff161616)),
              ),
            ),
          ),
          SizedBox(height: 24),
          Expanded(
            child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'ساعات العمل',
                                  style: TextStyle(
                                      color: const Color(0xff161616),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "ReadexPro",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff161616),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "ReadexPro",
                                        fontStyle: FontStyle.normal,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 60,
                            width: screenWidth - 32,
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 18, bottom: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              /*border: Border.all(
                    color: Colors.black26,
                  ),*/
                              color: Color(0xffffffff),
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Iconsax.arrow_bottom,
                            ),
                            iconSize: 20,
                            iconEnabledColor: Color(0xff161616),
                            iconDisabledColor: Color(0xff161616),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 300,
                            width: screenWidth - 32,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            direction: DropdownDirection.right,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xffffffff),
                            ),

                            elevation: 8,
                            //offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              //thickness: MaterialStateProperty.all<double>(6),
                              //thumbVisibility: MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 16, right: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * (16 / 390)),
                      child: Opacity(
                        opacity: 0.699999988079071,
                        child: text(
                          text: "طابور",
                          fweight: FontWeight.w500,
                          fsize: 21,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    serviceContainer(
                      tex: "خدمة العملاء",
                      width: screenWidth - 32,
                      context: context,
                      textcontent: '''
                  فتح حساب  
                  اغلاق حساب
                  الشكاوي  
                    ''',
                      texttitle: 'الخدمات',
                      contex: context,
                      page: Service_screen(),
                    ),
                    SizedBox(height: 16),
                    serviceContainer(
                      tex: "الاستقبال",
                      width: screenWidth - 32,
                      context: context,
                      textcontent: '''
                  فتح حساب  
                  اغلاق حساب
                  الشكاوي  
                    ''',
                      texttitle: 'الخدمات',
                      contex: context,
                      page: Service_screen(),
                    ),
                    SizedBox(height: 16),
                    serviceContainer(
                      tex: "الحولات",
                      width: screenWidth - 32,
                      context: context,
                      textcontent: '''
                  فتح حساب  
                  اغلاق حساب
                  الشكاوي  
                    ''',
                      texttitle: 'الخدمات',
                      contex: context,
                      page: Service_screen(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
