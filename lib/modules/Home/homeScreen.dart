import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';
import 'package:tabor/modules/Home/map/mapscreen.dart';
import 'package:tabor/modules/Home/search/search.dart';

import '../login/cubit/logic.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var logInCubit = LoginCubit.get(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    var cubit = layoutCubit.get(context);

    return BlocConsumer<layoutCubit, layoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/unknown.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: DefoltSvgImage(
                                image: 'assets/images/frame_138.svg',
                                width: 20,
                                hight: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          specialtext(
                              text: '${cubit.userData?.username}',
                              fsize: 16,
                              fweight: FontWeight.w500,
                              talign: TextAlign.right),
                          SizedBox(
                            height: 8,
                          ),
                          specialtext(
                            text: " كيف يمكننا مساعدتك",
                            fweight: FontWeight.w300,
                            fcolor: Color(0xff7d7d7d),
                          ),
                        ],
                      ),
                      const Spacer(),
                      DefoltIcon(
                          width: 40,
                          hight: 40,
                          icon: Iconsax.search_normal_14,
                          context: context,
                          page: const SearchHomeScreen()),
                      const SizedBox(
                        width: 16,
                      ),
                      DefoltIcon(
                          width: 40,
                          hight: 40,
                          icon: Iconsax.location5,
                          context: context,
                          page: MapHome())
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
                            child: specialtext(
                              text: "الاكثر انتشاراً",
                              fweight: FontWeight.w500,
                              fsize: 21,
                            ),
                          ),
                        ),
                        Container(
                          height: (screenHight * 0.11) + 76,
                          child: ConditionalBuilder(
                            condition:
                                layoutCubit.get(context).bankModel.isNotEmpty,
                            builder: (context) => ListView.builder(
                              itemCount:
                                  layoutCubit.get(context).bankModel.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return DefoltHorisentalCompanyform(
                                  context: context,
                                  width: 155,
                                  hight: 96,
                                  model:
                                      layoutCubit.get(context).bankModel[index],
                                );
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
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
                            child: specialtext(
                              text: "مراكز الخدمة",
                              fsize: 21,
                              fweight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ConditionalBuilder(
                          condition:
                              layoutCubit.get(context).bankModel.isNotEmpty,
                          builder: (context) => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                layoutCubit.get(context).bankModel.length,
                            itemBuilder: (context, index) =>
                                VerticalCompanyForm(
                              Iconopacity: 1,
                              model: layoutCubit.get(context).bankModel[index],
                              context: context,
                              screenWidth: screenWidth,
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
