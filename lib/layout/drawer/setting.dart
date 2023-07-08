import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/layout/drawer/notifications.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/shared/componants/componant.dart';

class Setting extends StatefulWidget {
  Setting({
    super.key,
  });
  static String userName = '';
  static String mopile = '';
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //void compare;

  @override
  String name = Setting.userName;

  String phoneNumber = Setting.mopile;

  Color saveColor = Color(0xff7d7d7d);
  final formkey = GlobalKey<ScaffoldState>();

  var phoneControlar = TextEditingController();

  var nameControlar = TextEditingController();
  void updateSaveColor() {
    String newName = nameControlar.text;
    String newPhoneNumber = phoneControlar.text;

    if (newName != name || newPhoneNumber != phoneNumber) {
      setState(() {
        saveColor = Color(0xff009c7b); // Change the color to the desired color
      });
    } else {
      setState(() {
        saveColor = Color(0xff7d7d7d); // Change the color to the default color
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameControlar.text = name;
    phoneControlar.text = phoneNumber;
    nameControlar.addListener(updateSaveColor);
    phoneControlar.addListener(updateSaveColor);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    // bool isTextGreen = (nameController.text != name || phoneController.text != phoneNumber);
    return BlocProvider(
      create: (BuildContext context) => layoutCubit(),
      child: BlocConsumer<layoutCubit, layoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = layoutCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              key: formkey,
              backgroundColor: Color(0xffe9ebeb),
              drawer: SpecificDrawer(
                  userName: cubit.userData?.username ?? 'احمد',
                  usetPhone: cubit.userData?.username ?? '01146399104',
                  screenWidth: screenWidth,
                  screenheight: screenHight,
                  notifyNumber: cubit.notificationsNumber,
                  darktMode: cubit.darktMode,
                  lightMode: cubit.lightMode,
                  navigyEdit: () {
                    // NavigateTo(context, Setting());
                  },
                  navigyNotify: () {
                    NavigateTo(context, Notifications());
                  },
                  darkfunction: () {
                    cubit.toggleDarkMode();
                  },
                  lightfunction: () {
                    cubit.toggleLightMode();
                  }),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 120,
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
                      padding: const EdgeInsets.only(
                          right: 16, left: 24, bottom: 24, top: 54),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                formkey.currentState!.openDrawer();
                              },
                              child: DefoltSvgImage(
                                  image: 'assets/images/frame_138.svg'),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: specialtext(
                                text: 'المعلومات الشخصية',
                                fsize: 21,
                                talign: TextAlign.right,
                                fweight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                if ((nameControlar.text != name ||
                                    phoneControlar.text != phoneNumber)) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Positioned(
                                left: 0,
                                bottom: 0,
                                child: specialtext(
                                  text: 'حفظ',
                                  fcolor: saveColor,
                                  fsize: 18,
                                  fweight: FontWeight.w500,
                                  talign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(24, 32, 24, 0),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(
                            child: Container(
                              width: 128,
                              height: 128,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/unknown.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(

                                          //borderRadius: BorderRadius.all(Radius.circular(16)),
                                          /* image: DecorationImage(
                                          image: AssetImage('assets/images/vuesax_linear_gallery_add.png'),
                                          fit: BoxFit.fill
                                          ),*/
                                          ),
                                      child: Icon(
                                        Icons.add_photo_alternate_rounded,
                                        color: const Color(0xff7d7d7d),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: specialtext(
                                          text: ' تغيير الصورة الشخصية',
                                          fcolor: const Color(0xff7d7d7d),
                                          talign: TextAlign.right,
                                          fsize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              specialtext(
                                text: 'الاسم',
                                fsize: 16,
                                fcolor: Color(0xff7d7d7d),
                                fweight: FontWeight.w400,
                                talign: TextAlign.right,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          defaultFormFieldSetting(
                            width: double.infinity,
                            controller: nameControlar,
                            type: TextInputType.name,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء ادخال اسم صحيح';
                              }
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              specialtext(
                                text: 'رقم الهاتف',
                                fsize: 16,
                                fcolor: Color(0xff7d7d7d),
                                fweight: FontWeight.w400,
                                talign: TextAlign.right,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          defaultFormFieldSetting(
                            width: double.infinity,
                            controller: phoneControlar,
                            type: TextInputType.phone,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return ' الرجاء ادخال رقم الهاتف';
                              }
                            },
                            //fsize: 16,
                            //fcolor: Color(0xff161616),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 32),
                    child: navigationButton(
                      text: 'القائمة الرئيسية',
                      function: () {
                        NavigateTo(
                            context,
                            const Directionality(
                                textDirection: TextDirection.rtl,
                                child: layoutScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
