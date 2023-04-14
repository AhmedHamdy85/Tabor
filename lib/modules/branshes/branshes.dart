import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/modules/service/service.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class BranshesScreen extends StatelessWidget {
  const BranshesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          AppBar2(
              screenHight: screenHight,
              screenWidth: screenWidth,
              text: 'السابق',
              context: context),
          SizedBox(
            height: 192,
            child: Image.network(
              'https://www.bankygate.com/UserFiles/News/2021/04/05/19740.jpg?210405152916',
              width: screenWidth,
              height: 192,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Color(0xff40000000), blurRadius: 4)
                  ],
                  color: Color(0xfff5f5f5),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Opacity(
                                opacity: 0.6,
                                child: Icon(
                                  Iconsax.heart5,
                                  size: 32,
                                ),
                              )),
                          SizedBox(
                            width: screenWidth * 0.25,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("البنك الاهلى المصرى",
                                  style: const TextStyle(
                                      color: const Color(0xff161616),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "ReadexPro",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 21.0),
                                  textAlign: TextAlign.right),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      'فرع',
                                      style: const TextStyle(
                                          color: const Color(0xff161616),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "ReadexPro",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Text(
                                      ' ' + '15',
                                      style: const TextStyle(
                                          color: const Color(0xff161616),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "ReadexPro",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 46,
                    ),
                    Opacity(
                      opacity: 0.2,
                      child: Center(
                        child: Container(
                            width: screenWidth - 32,
                            height: 2,
                            color: Color(0xff161616)),
                      ),
                    ),
                    for (int i = 0; i <= 5; i++)
                      BranshesCard(
                          screenWidth: screenWidth,
                          context: context,
                          image: 'assets/images/status.svg',
                          name: 'الفيوم-فرع الجامعة',
                          destance: 15)
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
