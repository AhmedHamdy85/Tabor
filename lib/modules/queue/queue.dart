import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/form/formscheduling_screen.dart';
import 'package:tabor/modules/service/service.dart';
import 'package:tabor/modules/sinup_screen/sinUpScreen.dart';
import 'package:tabor/modules/test/test.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';
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
    var _selectedItem;
    List<String> dayItems = [
      'السبت',
      'الاحد',
      'الاثنين',
      'الثلاثاء',
      'الاربعاء',
      'الخميس',
    ];
    bool s1 = false;
    bool s2 = false;
    bool s3 = false;
    String? selectedValue;
    int? ServiceValue;
    double bottomLeft;
    double bottomRight;
    bool dropservice = false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xff40000000))],
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
                          image:
                              'assets/images/vuesax_bulk_arrow_square_right.svg'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text('الفيوم-فرع الجامعة',
                          style: const TextStyle(
                              color: Color(0xff161616),
                              fontWeight: FontWeight.w600,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.right),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.green, radius: 6),
                          SizedBox(
                            height: 3,
                          ),
                          specialtext(
                            text: "مفتوح",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
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
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Text(
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
                                Spacer(),
                              ],
                            ),
                            items: [
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(0)),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(1)),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(2)),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(3)),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(4)),
                                enabled: false,
                              ),
                              DropdownMenuItem(
                                child: itemDropdown(day: dayItems.elementAt(5)),
                                enabled: false,
                              ),
                            ],
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
                                color: Color(0xffffffff),
                              ),
                              elevation: 10,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconEnabledColor: Color(0xff161616),
                              iconDisabledColor: Color(0xff161616),
                              openMenuIcon: Icon(
                                Icons.arrow_drop_up,
                                color: Color(0xff009c7b),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 300,
                              width: screenWidth - 32,
                              //padding: EdgeInsets.only(left: 16, right: 16),
                              direction: DropdownDirection.textDirection,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(14),
                                  bottomRight: Radius.circular(14),
                                ),
                                color: Color(0xffffffff),
                              ),
                              elevation: 0,
                              //offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                //thickness: MaterialStateProperty.all<double>(6),
                                //thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 8, right: 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: specialtext(
                          text: 'الطابور',
                          fsize: 18,
                          fweight: FontWeight.w500,
                          fcolor: Color(0xff7d7d7d),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                specialtext(
                                    text: 'خدمة العملاء',
                                    fsize: 16,
                                    fweight: FontWeight.w700),
                                Spacer(),
                                /* Icon(Icons.check,
                                color: Color(0xff1cc500),
                                size: 24,
                                ),*/
                                /* DefoltSvgImage(image: 'assets/images/vuesax_bold_arrow_down.svg',
                                width: 40,
                                hight: 40
                                ),*/
                              ],
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        // ServiceValue=value;
                                        s1 = true;
                                        s2 = false;
                                        s3 = false;
                                      });
                                    },
                                    child: RadioListTile(
                                      value: 1,
                                      title: specialtext(
                                          text: 'فتح /غلق حساب',
                                          fsize: 16,
                                          fweight: FontWeight.w500),
                                      groupValue: ServiceValue,
                                      onChanged: (value) {
                                        setState(() {
                                          ServiceValue = value;
                                          s1 = true;
                                          s2 = false;
                                          s3 = false;
                                        });
                                      },
                                      toggleable: true,
                                      selected: s1,
                                      activeColor: Color(0xff009c7b),
                                      //tileColor: Color(0xff009c7b),
                                      selectedTileColor: Color(0xffbceee3),
                                    ),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: RadioListTile(
                                    value: 2,
                                    title: specialtext(
                                        text: 'فتح /غلق حساب',
                                        fsize: 16,
                                        fweight: FontWeight.w500),
                                    groupValue: ServiceValue,
                                    onChanged: (value) {
                                      setState(() {
                                        ServiceValue = value;
                                        s1 = false;
                                        s2 = true;
                                        s3 = false;
                                      });
                                    },
                                    selected: s2,
                                    activeColor: Color(0xff009c7b),
                                    //tileColor: Color(0xff009c7b),
                                    selectedTileColor: Color(0xffbceee3),
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: RadioListTile(
                                    value: 3,
                                    title: specialtext(
                                        text: 'فتح /غلق حساب',
                                        fsize: 16,
                                        fweight: FontWeight.w500),
                                    groupValue: ServiceValue,
                                    onChanged: (value) {
                                      setState(() {
                                        ServiceValue = value;
                                        s1 = false;
                                        s2 = false;
                                        s3 = true;
                                      });
                                    },
                                    selected: s3,
                                    activeColor: Color(0xff009c7b),
                                    // tileColor: Color(0xff009c7b),
                                    selectedTileColor: Color(0xffbceee3),
                                  ),
                                ),
                              ),
                            ],
                            value: ServiceValue,
                            onChanged: (value) {
                              setState(() {
                                //ServiceValue = value  ;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 60,
                              width: screenWidth - 32,
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, top: 18, bottom: 18),
                              decoration: BoxDecoration(
                                borderRadius: // BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16)) ,
                                    BorderRadius.circular(16),
                                color: Color(0xffffffff),
                              ),
                              elevation: 10,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                              ),
                              iconEnabledColor: Color(0xff161616),
                              iconDisabledColor: Color(0xff161616),
                              openMenuIcon: Icon(
                                Icons.arrow_drop_up,
                                color: Color(0xff009c7b),
                              ),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 300,
                              width: screenWidth - 32,
                              //padding: EdgeInsets.only(left: 16, right: 16),
                              direction: DropdownDirection.textDirection,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                color: Color(0xffffffff),
                              ),
                              elevation: 0,
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 8, right: 8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          buttonCardBottom(
              space: (16 / 390) * screenWidth,
              widthCard: (158 / 390) * screenWidth,
              function1: () {
                NavigateTo(context, Service_screen());
              },
              text1: ' حجز الان',
              image1: 'assets/images/vuesax_bold_ticket_expired.svg',
              function2: () {
                NavigateTo(context, FormScheduling());
              },
              text2: ' حجز مسبق ',
              image2: 'assets/images/vuesax_bold_calendar_tick.svg'),
        ],
      ),
    );
  }
}
