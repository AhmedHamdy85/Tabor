import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/branshes/branshes.dart';
import 'package:tabor/shared/componants/componant.dart';

class RequirementScreen extends StatefulWidget {
  const RequirementScreen({super.key});

  @override
  State<RequirementScreen> createState() => _RequirementScreenState();
}

class _RequirementScreenState extends State<RequirementScreen> {
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
                   /* Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: DefoltSvgImage(
                            image:
                                'assets/images/vuesax_bulk_arrow_square_right.svg'),
                      ),
                    ),*/
                    SizedBox(
                      width: 4,
                    ),
                        Text('الشروط والاوراق المطلوبه',
                            style: const TextStyle(
                                color: Color(0xff161616),
                                fontWeight: FontWeight.w600,
                                fontFamily: "ReadexPro",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            textAlign: TextAlign.right),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Color(0xffbceee3),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
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
                      const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          specialtext(text: 'الشروط',
                          fcolor: Color(0xff7d7d7d),
                          fweight: FontWeight.w500,
                          fsize: 16
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            padding: EdgeInsetsDirectional.only(start: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                specialtext(text: '. مصري الجنسية'),
                                specialtext(text: '. اجنبي'),
                                richRequireText(tex1: '. قاصر', 
                                tex2: '(بأسمه تحت الولاية او الوصاية او الهبه)'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32,),
                          specialtext(text: 'الاوراق المطلوبه',
                          fcolor: const Color(0xff7d7d7d),
                          fweight: FontWeight.w500,
                          fsize: 16,
                          ),
                          const SizedBox(height: 24,),
                          Container(
                            padding: EdgeInsetsDirectional.only(start: 8,top: 8),
                            height: 72,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16),
                              ),
                              color:Color(0xffe9ebeb),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                richRequireText(tex1: '١. بطاقة الرقم القومي', tex2: '(السجل المدني)'),
                                SizedBox(height: 4,),
                                InkWell(
                                  onTap: (){
                                      NavigateTo(context, const Directionality(textDirection: TextDirection.rtl,
                                      child: layoutScreen()));
                                    },
                                  child: Container(
                                    height: 32,
                                    width: (228/333)*screenWidth,
                                    alignment: AlignmentDirectional.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                        color:const Color(0xffd8d8d8),
                                      ),
                                      color:const Color(0xffffffff),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:Color(0xff40000000),
                                          blurRadius: 8
                                        )
                                      ],
                                    ),
                                    child: specialtext(text: 'فروع السجل المدني',
                                    fcolor: Color(0xff009c7b),
                                    fweight: FontWeight.w500
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //color:const Color(0xffffffff),
                        const  SizedBox(height: 8,), 
                        Container(
                            padding: EdgeInsetsDirectional.only(start: 8,top: 8),
                            height: 72,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16),
                              ),
                              color:Color(0xffe9ebeb),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                richRequireText(tex1: '٢. رقم هاتف مسجل باسم صاحب الحساب ',
                                 tex2: '(مركز خدمه فودافون)'),
                                const SizedBox(height: 4,),
                                InkWell(
                                  onTap: (){
                                      NavigateTo(context, const Directionality(textDirection: TextDirection.ltr,
                                      child: BranshesScreen()));
                                  },
                                  child: Container(
                                    height: 32,
                                    width: (228/333)*screenWidth,
                                    alignment: AlignmentDirectional.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                        color:const Color(0xffd8d8d8),
                                      ),
                                      color:  const Color(0xffffffff),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:Color(0xff40000000),
                                          blurRadius: 8
                                        )
                                      ],
                                    ),
                                    child: specialtext(text: 'فروع خدمة فودافون',
                                    fcolor: Color(0xff009c7b),
                                    fweight: FontWeight.w500
                                    ),      
                                  ),
                                ),
                              ]
                            )
                        ),
                        const SizedBox(height: 8,),
                        specialtext(
                          text: '٣. شهادة الميلاد للقصر',
                        ),
                        const SizedBox(height: 32,),
                        navigationButton(text: 'حسنا',
                      function: (){
                        
                      Navigator.pop(context);
                      },
                      ),
                        ],//here
                      ),       
                   ),
                 ),
              ),
            ),
          ],
        ),
   ),
  );
  }
}