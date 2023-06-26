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
    //final scaffoldKey = GlobalKey<ScaffoldState>();
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => layoutCubit()
        ..getAllBanks()
        ..getFavoretBanks()
        ..getActiveTeckit(),
      child: BlocConsumer<layoutCubit, layoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = layoutCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            drawer: Container(
              width: (290 / 390) * screenwidth,
              height: screenheight,
              color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    height: (224 / 844) * screenheight,
                    child: UserAccountsDrawerHeader(
                      accountName: Text(
                        "نادر سيد",
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                            fontFamily: "ReadexPro",
                            fontStyle: FontStyle.normal,
                            fontSize: 21.0),
                        textAlign: TextAlign.center,
                      ),
                      accountEmail: Text("01125229119",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0),
                          textAlign: TextAlign.right),
                      currentAccountPicture: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/unknown.png',
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: cubit.notificationsNumber > 0
                            ? Color(0xffe9ebeb)
                            : null,
                      ),
                      child: ListTile(
                        selectedColor: Colors.grey,
                        horizontalTitleGap: 0,
                        leading: Container(
                          width: 24,
                          height: 24,
                          child: DefoltSvgImage(
                              image:
                                  'assets/images/vuesax_outline_notification.svg'),
                        ),
                        title: specialtext(
                          text: 'الاشعارات',
                        ),
                        trailing: CircleAvatar(
                          radius: 10,
                          backgroundColor: cubit.notificationsNumber > 0
                              ? Color(0xff009c7b)
                              : Colors.white,
                          child: specialtext(
                            text: '${cubit.notificationsNumber}',
                            fcolor: Color(0xffe9ebeb),
                          ),
                        ),
                        onTap: () {
                          NavigateTo(context, Notifications());
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image:
                                'assets/images/vuesax_outline_setting_2.svg'),
                      ),
                      title: specialtext(
                        text: 'تعديل الملف الشخصي',
                      ),
                      onTap: () {
                        NavigateTo(context, Setting());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image: 'assets/images/vuesax_outline_global.svg'),
                      ),
                      title: specialtext(
                        text: 'اللغة',
                      ),
                      subtitle: specialtext(
                        text: 'العربية',
                        fcolor: Color(0xff7d7d7d),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image: 'assets/images/vuesax_outline_book.svg'),
                      ),
                      title: specialtext(
                        text: 'سياسة الخصوصية',
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image:
                                'assets/images/vuesax_outline_clipboard_text.svg'),
                      ),
                      title: specialtext(
                        text: 'الشروط والاحكام',
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image: 'assets/images/vuesax_outline_message.svg'),
                      ),
                      title: specialtext(
                        text: 'تواصل معنا',
                      ),
                      onTap: () {},
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      selectedColor: Colors.grey,
                      horizontalTitleGap: 0,
                      leading: Container(
                        width: 24,
                        height: 24,
                        child: DefoltSvgImage(
                            image: 'assets/images/vuesax_outline_logout.svg'),
                      ),
                      title: specialtext(
                        text: 'تسجيل الخروج',
                      ),
                      onTap: () {},
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (25 / 390) * screenwidth),
                    child: Container(
                      width: (242 / 390) * screenwidth,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color:
                            cubit.darktMode ? Colors.black : Color(0xffe9e9e9),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.toggleDarkMode();
                            },
                            child: Container(
                              width: (117 / 390) * screenwidth,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: cubit.darktMode
                                    ? Colors.black
                                    : Color(0xffe9e9e9),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  specialtext(
                                      text: 'Dark',
                                      fcolor: cubit.darktMode
                                          ? Colors.orange
                                          : Color(0xff8c8c8c),
                                      fsize: 16,
                                      ffamily: 'Roboto-Medium',
                                      fweight: FontWeight.w500,
                                      talign: TextAlign.center),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Iconsax.moon5,
                                    size: 25,
                                    color: cubit.darktMode
                                        ? Colors.orange
                                        : Color(0xff8c8c8c),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              cubit.toggleLightMode();
                            },
                            child: Container(
                              width: (117 / 390) * screenwidth,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff40000000),
                                      blurRadius: 4),
                                ],
                                color: cubit.lightMode
                                    ? Color(0xffffffff)
                                    : Colors.black,
                                //Color(0xffffffff),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  specialtext(
                                      text: 'Light',
                                      fcolor: cubit.lightMode
                                          ? Color(0xff3e3e3e)
                                          : Color(0xff8c8c8c),
                                      fsize: 16,
                                      ffamily: 'Roboto-Medium',
                                      fweight: FontWeight.w500,
                                      talign: TextAlign.center),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Iconsax.sun_15,
                                    size: 22.5,
                                    color: cubit.lightMode
                                        ? Color(0xff3e3e3e)
                                        : Color(0xff8c8c8c),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xff40000000))],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                color: Color(0xffffffff),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(right: 32, left: 32, bottom: 32, top: 8),
                child: GNav(
                  onTabChange: (value) {
                    cubit.changeNaveBar(value);
                  },
                  selectedIndex: cubit.curentIndex,
                  gap: 16,
                  backgroundColor: Color(0xffffffff),
                  textStyle: TextStyle(color: Color(0xffffffff)),
                  activeColor: Color(0xffffffff),
                  tabBackgroundColor: Color(0xff009c7b),
                  tabBorderRadius: 24,
                  padding: EdgeInsets.all(8),
                  tabs: [
                    GButton(
                      icon: cubit.curentIndex == 0
                          ? Iconsax.home_25
                          : Iconsax.home_24,
                      iconColor: Color(0xff161616),
                      text: 'الرئيسية',
                    ),
                    GButton(
                      icon: cubit.curentIndex == 1
                          ? Iconsax.ticket5
                          : Iconsax.ticket4,
                      iconColor: Color(0xff161616),
                      text: 'التذاكر',
                    ),
                    GButton(
                      icon: cubit.curentIndex == 2
                          ? Iconsax.heart5
                          : Iconsax.heart4,
                      iconColor: Color(0xff161616),
                      text: 'المفضلة',
                    ),
                  ],
                ),
              ),
            ),
            body: cubit.bottmScreen[cubit.curentIndex],
          );
        },
      ),
    );
  }
}
