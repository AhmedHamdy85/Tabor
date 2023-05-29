import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 120,
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
                  padding: const EdgeInsets.only(right: 16, left: 24, bottom: 24,top: 54),
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
                                  'assets/images/frame_138.svg'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: specialtext(
                                text: 'الاشعارات',
                                fsize: 21,
                                talign:  TextAlign.right,
                                fweight: FontWeight.w500,
                              ),
                            ),                  
                        Spacer(),
                        InkWell(
                          onTap: (){
                             NavigateTo(context,Directionality(textDirection: TextDirection.rtl,
                        child: layoutScreen())
                         );
                          },
                          child: Positioned(
                            left: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffbceee3),
                               radius: 20,
                               child: DefoltSvgImage(image: 'assets/images/frame_32.svg'),
                               ),
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
                    
                  ],
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}