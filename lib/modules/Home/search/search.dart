import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

import '../../../model/bankmodels/all_banks_model/all_banks_model.dart';
import '../../../shared/componants/constants.dart';
import '../../branshes/branshes.dart';

class SearchHomeScreen extends StatefulWidget {
  const SearchHomeScreen({super.key});

  @override
  State<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // filterList('kl');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider(
          create: (BuildContext context) => layoutCubit(),
          child: BlocConsumer<layoutCubit, layoutStates>(
              listener: (context, state) => {},
              builder: (context, state) {
                var cubit = layoutCubit.get(context);
                return Scaffold(
                  backgroundColor: const Color(0xffe9ebeb),
                  body: Column(
                    children: [
                      Container(
                        height: screenHight * 0.17,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, bottom: 16),
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
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: screenWidth - 72,
                                height: 40,
                                decoration: const BoxDecoration(
                                    color: Color(0xffbceee3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: TextField(
                                  onChanged: (value) =>
                                      cubit.filterHomeList(value),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor,
                                    fontFamily: "ReadexPro",
                                    fontStyle: FontStyle.normal,
                                  ),
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    suffixIcon: Icon(Iconsax.search_normal),
                                    iconColor: mainColor,
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffbceee3)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    hintText: 'ما الذي تبحث عنه ؟',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Flexible(
                        child: cubit.displayHomeList.isEmpty
                            ? Center(
                                child: specialtext(
                                    text: 'برجاء ادخال بيانات صحيحه',
                                    fcolor: mainColor,
                                    fweight: FontWeight.w600,
                                    fsize: 24),
                              )
                            : ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          color: Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xff40000000),
                                              blurRadius: 4,
                                            ),
                                          ]),
                                      child: ListTile(
                                        title: specialtext(
                                            text: cubit.displayHomeList[index],
                                            fsize: 16,
                                            fweight: FontWeight.w500),
                                        trailing: MaterialButton(
                                            minWidth: 80,
                                            height: 24,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            color: const Color(0xff009c7b),
                                            child: specialtext(
                                                text: 'حجز',
                                                fcolor: const Color(0xffffffff),
                                                fweight: FontWeight.w500),
                                            onPressed: () {
                                              NavigateTo(
                                                context,
                                                BranshesScreen(
                                                  model: AllBanksModel(),
                                                ), ///////////////////////////////////////////////////////////////////////////////////
                                              );
                                            }),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 16,
                                  );
                                },
                                itemCount: cubit.displayHomeList.length),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
