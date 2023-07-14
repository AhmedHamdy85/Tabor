import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/layout/drawer/notifications.dart';
import 'package:tabor/layout/drawer/setting.dart';
import 'package:tabor/shared/componants/componant.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

class layoutScreen extends StatelessWidget {
  const layoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return BlocConsumer<layoutCubit, layoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = layoutCubit.get(context);

        return Scaffold(
          key: scaffoldKey,
          drawer: SpecificDrawer(
              context: context,
              userName: cubit.userData?.username ?? '',
              usetPhone: cubit.userData?.mobile ?? '',
              screenWidth: screenwidth,
              screenheight: screenheight,
              notifyNumber: cubit.notificationsNumber,
              darktMode: cubit.darktMode,
              lightMode: cubit.lightMode,
              navigyEdit: () {
                NavigateTo(context, const Setting());
              },
              navigyNotify: () {
                NavigateTo(context, const Notifications());
              },
              darkfunction: () {
                cubit.toggleDarkMode();
              },
              lightfunction: () {
                cubit.toggleLightMode();
              }),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xff40000000))],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              color: Color(0xffffffff),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 32, left: 32, bottom: 32, top: 8),
              child: GNav(
                onTabChange: (value) {
                  cubit.changeNaveBar(value);
                },
                selectedIndex: cubit.curentIndex,
                gap: 16,
                backgroundColor: const Color(0xffffffff),
                textStyle: const TextStyle(color: Color(0xffffffff)),
                activeColor: const Color(0xffffffff),
                tabBackgroundColor: const Color(0xff009c7b),
                tabBorderRadius: 24,
                padding: const EdgeInsets.all(8),
                tabs: [
                  GButton(
                    icon: cubit.curentIndex == 0
                        ? Iconsax.home_25
                        : Iconsax.home_24,
                    iconColor: const Color(0xff161616),
                    text: 'الرئيسية',
                  ),
                  GButton(
                    icon: cubit.curentIndex == 1
                        ? Iconsax.ticket5
                        : Iconsax.ticket4,
                    iconColor: const Color(0xff161616),
                    text: 'التذاكر',
                  ),
                  GButton(
                    icon: cubit.curentIndex == 2
                        ? Iconsax.heart5
                        : Iconsax.heart4,
                    iconColor: const Color(0xff161616),
                    text: 'المفضلة',
                  ),
                ],
              ),
            ),
          ),
          body: cubit.bottmScreen[cubit.curentIndex],
        );
      },
    );
  }
}
