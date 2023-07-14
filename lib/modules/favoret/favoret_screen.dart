import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/shared/componants/componant.dart';

class FavoretScreen extends StatelessWidget {
  const FavoretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //  double screenHight = MediaQuery.of(context).size.height;
    return BlocConsumer<layoutCubit, layoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CustomAppBar(
                text: 'المفضلة', screenWidth: screenWidth, context: context),
            Expanded(
              child: SizedBox(
                  width: double.infinity,
                  child: ConditionalBuilder(
                    condition: state is! GetFavoretBanksLoadingState,
                    builder: (context) => ListView.builder(
                      itemBuilder: (context, index) => FavoretIteam(
                          model: layoutCubit.get(context).favoretModel[index],
                          screenWidth: screenWidth,
                          context: context),
                      itemCount: layoutCubit.get(context).favoretModel.length,
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  )),
            )
          ],
        );
      },
    );
  }
}
