import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHight * 0.17,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            boxShadow: [BoxShadow(color: Color(0xff40000000))],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/user.jpg',
                  width: screenWidth * 0.14,
                  height: screenWidth * 0.14,
                ),
                SizedBox(
                  width: 1,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" مرحبا احمد",
                        style: const TextStyle(
                            color: const Color(0xff161616),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ReadexPro',
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.right),
                    Text(" كيف يمكننى مساعدتك",
                        style: const TextStyle(
                            color: const Color(0xff161616),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'ReadexPro',
                            fontStyle: FontStyle.normal,
                            fontSize: 14),
                        textAlign: TextAlign.right)
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.13,
                ),
                DefoltIcon(
                    width: screenWidth * 0.1,
                    hight: screenWidth * 0.1,
                    icon: Iconsax.search_normal_14),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                DefoltIcon(
                    width: screenWidth * 0.1,
                    hight: screenWidth * 0.1,
                    icon: Iconsax.location5)
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHight * 0.23,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Opacity(
                      opacity: 0.699999988079071,
                      child: Text("الاكثر انتشاراً",
                          style: const TextStyle(
                              color: const Color(0xff161616),
                              fontWeight: FontWeight.w500,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0),
                          textAlign: TextAlign.right),
                    ),
                  ),
                  Container(
                    height: (screenHight * 0.11) + 51,
                    child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DefoltHorisentalCompanyform(
                          context: context,
                          image: 'assets/images/Tabor_Horsintal.svg',
                          width: 155,
                          hight: 96,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHight * 0.047,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                    ),
                    child: Opacity(
                      opacity: 0.699999988079071,
                      child: Text("مراكز الخدمة",
                          style: const TextStyle(
                              color: const Color(0xff161616),
                              fontWeight: FontWeight.w500,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 21.0),
                          textAlign: TextAlign.right),
                    ),
                  ),
                  for (int i = 0; i <= 5; i++)
                    VerticalCompanyForm(
                        Iconopacity: 0.6,
                        name: 'خدمة عملاء فودافون',
                        image: 'assets/images/Googel.svg',
                        nomberOfBranshes: 15,
                        context: context,
                        screenWidth: screenWidth,
                        iconColor: Colors.black),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
