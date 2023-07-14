import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/model/bankmodels/all_banks_model/all_banks_model.dart';

import 'package:tabor/modules/branshes/search/search_branches.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

import '../Home/map/map_branches.dart';

class BranshesScreen extends StatelessWidget {
  const BranshesScreen({super.key, required this.model});
  final AllBanksModel model;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return BlocConsumer<layoutCubit, layoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar2(
                  screenHight: screenHight,
                  screenWidth: screenWidth,
                  text: 'السابق',
                  context: context,
                  screenMap: MapBranchesScreen(
                    bankName: '${model.name}',
                  ),
                  screenSearch: const SearchBranchesScreen()),
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
                  decoration: const BoxDecoration(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Opacity(
                                    opacity: 0.6,
                                    child: Icon(
                                      Iconsax.heart5,
                                      size: 32,
                                      color: layoutCubit
                                                  .get(context)
                                                  .favoret[model.id] ??
                                              false
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('${model.name}',
                                      style: const TextStyle(
                                          color: Color(0xff161616),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "ReadexPro",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 21.0),
                                      textAlign: TextAlign.right),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const Opacity(
                                        opacity: 0.5,
                                        child: Text(
                                          'فرع',
                                          style: TextStyle(
                                              color: Color(0xff161616),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "ReadexPro",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: Text(
                                          ' ' '${model.branchs?.length ?? 0}',
                                          style: const TextStyle(
                                              color: Color(0xff161616),
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
                        const SizedBox(
                          height: 46,
                        ),
                        Opacity(
                          opacity: 0.2,
                          child: Center(
                            child: Container(
                                width: screenWidth - 32,
                                height: 2,
                                color: const Color(0xff161616)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 32,
                            right: 16,
                          ),
                          child: Text("الفروع",
                              style: TextStyle(
                                  color: Color(0xff7d7d7d),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18.0),
                              textAlign: TextAlign.right),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: model.branchs?.length ?? 0,
                            itemBuilder: (context, index) => BranshesCard(
                                screenWidth: screenWidth,
                                context: context,
                                image: 'assets/images/status.svg',
                                bankName: '${model.name}',
                                branshName:
                                    '${model.branchs![index].nameOfBranch}',
                                destance:
                                    '${model.branchs![index].distanceBranchUser}'))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
