import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class FavoretScreen extends StatelessWidget {
  const FavoretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return BlocConsumer<layoutCubit, layoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CustomAppBar(text: 'المفضلة', screenWidth: screenWidth),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, index) => FavoretIteam(
                      model: layoutCubit.get(context).favoretIteams[index],
                      screenWidth: screenWidth,
                      context: context),
                  itemCount: layoutCubit.get(context).favoretIteams.length,
                ),
              ),
            )
          ],
        );
      },
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
