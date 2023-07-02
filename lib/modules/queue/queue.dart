import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tabor/modules/form/formscheduling_screen.dart';
import 'package:tabor/modules/service/service.dart';
import 'package:tabor/shared/componants/componant.dart';

class QueuesScreen extends StatefulWidget {
  QueuesScreen({super.key, required this.name});
  String name;
  @override
  State<QueuesScreen> createState() => _QueuesScreenState();
}

class _QueuesScreenState extends State<QueuesScreen> {
  var surviceController = TextEditingController();
  var receptionController = TextEditingController();
  var transfersController = TextEditingController();
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
    String? selectedValue;
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
                      child: specialtext(
                          text: widget.name,
                          fsize: 18,
                          fweight: FontWeight.w600),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                              width: double.infinity,
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: specialtext(
                        text: 'الطابور',
                        fsize: 18,
                        fweight: FontWeight.w500,
                        fcolor: Color(0xff7d7d7d),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    specialtext(
                        text: 'خدمة العملاء',
                        fsize: 16,
                        fweight: FontWeight.w700),
                    const SizedBox(height: 8),
                    customDropDown(
                      controller: surviceController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    specialtext(
                        text: 'استقبال', fsize: 16, fweight: FontWeight.w700),
                    const SizedBox(
                      height: 8,
                    ),
                    customDropDown(controller: receptionController),
                    const SizedBox(
                      height: 16,
                    ),
                    specialtext(
                        text: 'حوالات', fsize: 16, fweight: FontWeight.w700),
                    const SizedBox(
                      height: 8,
                    ),
                    customDropDown(controller: transfersController),
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
