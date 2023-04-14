import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/modules/showTecket/showTecket.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class Service_screen extends StatelessWidget {
  const Service_screen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('الفيوم-فرع الجامعة',
                            style: const TextStyle(
                                color: Color(0xff161616),
                                fontWeight: FontWeight.w600,
                                fontFamily: "ReadexPro",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.right),
                        SizedBox(
                          height: 8,
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: Text("طابور خدمة العملاء",
                              style: const TextStyle(
                                  color: const Color(0xff161616),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.right),
                        )
                      ],
                    ),
                    SizedBox(
                      width: screenWidth * 0.27,
                    ),
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
                          child: Icon(Icons.close)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16, right: 16, bottom: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.699999988079071,
                          child: Text("الخدمات",
                              style: const TextStyle(
                                  color: const Color(0xff161616),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 21.0),
                              textAlign: TextAlign.right),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SirviceForm(
                            screenWidth: screenWidth,
                            context: context,
                            Service: 'فتح/اغلاق حساب'),
                        SirviceForm(
                            screenWidth: screenWidth,
                            context: context,
                            Service: 'استفسار عن الحساب '),
                        SirviceForm(
                            screenWidth: screenWidth,
                            context: context,
                            Service: 'شكوى '),
                        SizedBox(
                          height: 40,
                        ),
                        Opacity(
                          opacity: 0.699999988079071,
                          child: Text("وسيله النقل",
                              style: const TextStyle(
                                  color: const Color(0xff161616),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 21.0),
                              textAlign: TextAlign.right),
                        ),
                        TransportForm(
                            screenWidth: screenWidth,
                            context: context,
                            TransportTool: 'السيارة',
                            time: 15),
                        TransportForm(
                            screenWidth: screenWidth,
                            context: context,
                            TransportTool: 'دراجة',
                            time: 30),
                        TransportForm(
                            screenWidth: screenWidth,
                            context: context,
                            TransportTool: 'سير',
                            time: 45),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Color(0xff009c7b),
                minWidth: screenWidth - 32,
                height: 52,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  NavigateTo(context, ShowTecketScreen());
                },
                child: Text("  حجز الدور",
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "ReadexPro",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
