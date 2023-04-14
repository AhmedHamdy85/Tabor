import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class FavoretScreen extends StatelessWidget {
  const FavoretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(
            text: 'المفضلة',
            screenHight: screenHight,
            screenWidth: screenWidth),
        Expanded(
          child: Container(
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) => VerticalCompanyForm(
                  image: 'assets/images/Googel.svg',
                  name: 'خدمة عملاء فودافون',
                  nomberOfBranshes: 15,
                  context: context,
                  iconColor: Colors.red,
                  screenWidth: screenWidth),
              itemCount: 10,
            ),
          ),
        )
      ],
    );
  }
}


// SingleChildScrollView(
//               child: Column(
//                 children: [
//                   for (int i = 0; i <= 10; i++)
//                     VerticalCompanyForm(
//                         context: context,
//                         distance: screenWidth * 0.12,
//                         iconColor: Colors.red),
//                 ],
//               ),
//             ),