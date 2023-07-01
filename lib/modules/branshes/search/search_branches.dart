import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import '../../../layout/layout_screen.dart';
import '../../../shared/componants/componant.dart';
import '../../../shared/componants/iconsax_icons.dart';

class SearchBranchesScreen extends StatefulWidget {
   const SearchBranchesScreen({super.key});

  @override
  State<SearchBranchesScreen> createState() => _SearchBranchesScreenState();
}

class _SearchBranchesScreenState extends State<SearchBranchesScreen> {
  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Directionality(
        textDirection: TextDirection.rtl, 
        child: BlocProvider(
          create: (BuildContext context)=> layoutCubit() ,
          child: BlocConsumer<layoutCubit,layoutStates>(
            listener: (context, state) => {},
            builder: (context,state){
              return Column(
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: specialtext(text: 'بحث الفروع',
                            fsize: 21,
                            fweight: FontWeight.w500
                            ),
                          ),
                          Spacer(),
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
                                child: Icon(Iconsax.gps),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                    ),
                  ),
             ],
         );
        }
       ),
     ),
    ),
  );
 }
}