import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabor/modules/branshes/branshes.dart';
import 'package:tabor/modules/queue/queue.dart';

import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:lottie/lottie.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/model/bankmodels/all_banks_model/all_banks_model.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:slide_countdown/slide_countdown.dart';

Widget DefoltButon({
  double width = double.infinity,
  required double fontsize,
  Color background = Colors.blue,
  required VoidCallback? function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xffffffff),
            fontWeight: FontWeight.w500,
            fontFamily: "ReadexPro",
            fontStyle: FontStyle.normal,
            fontSize: 18,
          ),
        ),
      ),
    );

Widget DefoltTextButton(
        {required VoidCallback? function,
        required String text,
        required TextAlign direction}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              color: Color(0xff161616),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          textAlign: direction),
    );

Widget DefoltFormFilde({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onChange,
  GestureTapCallback? ontap,
  required FormFieldValidator<String>? validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isClicable = true,
  VoidCallback? SuffixPresd,
}) =>
    TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (value) {
        print(value);
      },
      onChanged: onChange,
      enabled: isClicable,
      validator: validate,
      onTap: ontap,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: SuffixPresd,
                icon: Icon(
                  suffix,
                ))
            : null,
        labelText: label,

        //border: OutlineInputBorder(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );

void NavigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void NavigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);

Widget DefoltSvgImage(
        {required String image,
        double? width,
        double? hight,
        bool Drawing = true}) =>
    SvgPicture.asset(
      image,
      width: width,
      height: hight,
      allowDrawingOutsideViewBox: Drawing,
    );

Widget DefoltIcon(
        {required double width,
        required double hight,
        required IconData icon,
        Widget? page,
        BuildContext? context}) =>
    InkWell(
      onTap: () {
        NavigateTo(context, page);
      },
      child: Container(
          width: width,
          height: hight,
          decoration: BoxDecoration(
              color: const Color(0xffbceee3),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 10, 90, 12),
          )),
    );

Widget DefoltHorisentalCompanyform(
        {required AllBanksModel model,
        //   required String image,
        // String? name,
        double? width,
        double? hight,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              NavigateTo(
                  context,
                  BranshesScreen(
                    model: model,
                  ));
            },
            child: Container(
              width: width,
              height: hight,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(
                  image: NetworkImage('${banksLogo['${model.name}']}'),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('${model.name}',
              style: const TextStyle(
                  color: Color(0xff161616),
                  fontWeight: FontWeight.w400,
                  fontFamily: "ReadexPro",
                  fontStyle: FontStyle.normal,
                  fontSize: 14),
              textAlign: TextAlign.right)
        ],
      ),
    );

Widget VerticalCompanyForm(
        {required AllBanksModel model,
        required double screenWidth,
        double Iconopacity = 0.0,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: InkWell(
        onTap: () {
          NavigateTo(
              context,
              BranshesScreen(
                model: model,
              ));
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                        image: NetworkImage('${banksLogo['${model.name}']}'))),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                      style: const TextStyle(
                          color: Color(0xff161616),
                          fontWeight: FontWeight.w500,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.right),
                  Text("${model.branchs!.length}" ' ' 'فرع',
                      style: const TextStyle(
                          color: Color(0xff161616),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.right)
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    layoutCubit
                        .get(context)
                        .changeFavorets(model.id, model.favorite);
                  },
                  icon: Opacity(
                    opacity: Iconopacity,
                    child: Icon(
                      Iconsax.heart5,
                      color: layoutCubit.get(context).favoret[model.id] ?? false
                          ? Colors.red
                          : Colors.black,
                      size: 32,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );

//custom favoret iteam

Widget FavoretIteam(
        {required AllBanksModel model,
        required double screenWidth,
        double Iconopacity = 1,
        required BuildContext context}) =>
    Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: InkWell(
        onTap: () {
          NavigateTo(
              context,
              BranshesScreen(
                model: model,
              ));
        },
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                        image: NetworkImage('${banksLogo['${model.name}']}'))),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                      style: const TextStyle(
                          color: Color(0xff161616),
                          fontWeight: FontWeight.w500,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.right),
                  Text("${model.branchs!.length}" ' ' 'فرع',
                      style: const TextStyle(
                          color: Color(0xff161616),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0),
                      textAlign: TextAlign.right)
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    layoutCubit
                        .get(context)
                        .changeFavorets(model.id, model.favorite);
                  },
                  icon: Opacity(
                    opacity: Iconopacity,
                    child: Icon(
                      Iconsax.heart5,
                      color: layoutCubit.get(context).favoret[model.id] ?? false
                          ? Colors.red
                          : Colors.black,
                      size: 32,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );

Widget CustomAppBar(
        { //double screenHight=120,
        required double screenWidth,
        required String text,
        required BuildContext context}) =>
    Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [BoxShadow(color: Color(0xff40000000))],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            specialtext(
              text: text,
              fweight: FontWeight.w600,
              fsize: 21,
            ),
            const Spacer(),
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.search_normal_14),
            const SizedBox(
              width: 16,
            ),
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.location5)
          ],
        ),
      ),
    );

Widget AppBar2({
  required double screenHight,
  required double screenWidth,
  required String text,
  required BuildContext context,
  required Widget screenMap,
  required Widget screenSearch,
}) =>
    Container(
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xff40000000))],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefoltIcon(
              width: 40,
              hight: 40,
              icon: Iconsax.location5,
              page: screenMap,
              context: context,
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            DefoltIcon(
                width: 40,
                hight: 40,
                icon: Iconsax.search_normal_14,
                page: screenSearch,
                context: context),
            const Spacer(),
            specialtext(
                text: text,
                fsize: 21,
                fcolor: const Color(0xff009c7b),
                fweight: FontWeight.w600),
            const SizedBox(
              width: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: DefoltSvgImage(
                  image: 'assets/images/vuesax_bulk_arrow_square_right.svg'),
            )
          ],
        ),
      ),
    );

Widget BranshesCard({
  required double screenWidth,
  required BuildContext context,
  required String image,
  required String branshName,
  required String bankName,
  required String destance,
}) =>
    Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: InkWell(
          onTap: () {
            NavigateTo(
                context,
                QueuesScreen(
                  branchName: branshName,
                  bankName: bankName,
                ));
          },
          child: Container(
            width: screenWidth - 32,
            height: 81,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color(0xffffffff),
              boxShadow: [BoxShadow(color: Color(0xff40000000), blurRadius: 4)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefoltSvgImage(image: image),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(branshName,
                          style: const TextStyle(
                              color: Color(0xff161616),
                              fontWeight: FontWeight.w500,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.right),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text("كم",
                              style: TextStyle(
                                  color: Color(0xff161616),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.right),
                          Text(" " + destance,
                              style: const TextStyle(
                                  color: Color(0xff161616),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.right),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

Widget SirviceForm({
  required double screenWidth,
  required BuildContext context,
  required String Service,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: screenWidth - 32,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffffffff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.7,
              child: Radio(
                value: 0,
                groupValue: 1,
                onChanged: (value) {},
              ),
            ),
            Expanded(
              child: Text(Service,
                  style: const TextStyle(
                      color: Color(0xff161616),
                      fontWeight: FontWeight.w500,
                      fontFamily: "ReadexPro",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.right),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Opacity(
                            opacity: 0.699999988079071,
                            child: Text("الاوراق المطلوبة",
                                style: TextStyle(
                                    color: Color(0xff161616),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "ReadexPro",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 21.0),
                                textAlign: TextAlign.right),
                          ),
                          content: Text(
                            'صورة البطاقة',
                            textAlign: TextAlign.right,
                          ),
                        );
                      });
                },
                child: DefoltSvgImage(
                    image: 'assets/images/vuesax_bulk_info_circle.svg'),
              ),
            ),
          ],
        ),
      ),
    );

enum SingingCharacter { one, jefferson }

Widget TransportForm({
  required double screenWidth,
  required BuildContext context,
  required String TransportTool,
  required double time,
  required Color containerColor,
}) =>
    Container(
      width: screenWidth - 32,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Opacity(
            opacity: 0.7,
            child: Radio(
              value: 0,
              groupValue: 1,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: Text(TransportTool,
                style: const TextStyle(
                    color: Color(0xff161616),
                    fontWeight: FontWeight.w500,
                    fontFamily: "ReadexPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.right),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text("$time دقيقة",
                style: const TextStyle(
                    color: Color(0xff161616),
                    fontWeight: FontWeight.w400,
                    fontFamily: "ReadexPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.right),
          ),
        ],
      ),
    );
/*Widget containerTransport({
  required double screenWidth,
        required BuildContext context,
        required String TransportTool,
        required double time,
        required Color containerColor,
 })=>
 Container(
      width: screenWidth - 32,
      height: 152,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
                selectedColor: Color(0xffbceee3),
                horizontalTitleGap: 0,
                leading: Opacity(
                opacity: 0.7,
                child: Radio(
                
                value: 1,
                groupValue: selectedTransport,
                onChanged: (value) {
                 // setState((){});
                  selectedTransport=value!;
                  
                },
                ),
                ),
                title: specialtext(
                  text: 'الاشعارات',
                  fweight: FontWeight.w500,
                  fsize: 16,
                ),
                trailing: specialtext(text: '"$time" + " " + "دقيقة"',),
                onTap: () {
                  //NavigateTo(context, Notifications());
                },
              ),
              ListTile(
                selectedColor: Color(0xffbceee3),
                horizontalTitleGap: 0,
                leading: Opacity(
                opacity: 0.7,
                child: Radio(
                
                value: 2,
                groupValue: selectedTransport,
                onChanged: (value) {
                 // setState((){});
                  selectedTransport=value!;
                  
                },
                ),
                ),
                title: specialtext(
                  text: 'الاشعارات',
                  fweight: FontWeight.w500,
                  fsize: 16,
                ),
                trailing: specialtext(text: '"$time" + " " + "دقيقة"',),
                onTap: () {
                  //NavigateTo(context, Notifications());
                },
              ),
              ListTile(
                selectedColor: Color(0xffbceee3),
                horizontalTitleGap: 0,
                leading: Opacity(
                opacity: 0.7,
                child: Radio(
                
                value: 3,
                groupValue: selectedTransport,
                onChanged: (value) {
                 // setState((){});
                  selectedTransport=value!;
                  
                },
                ),
                ),
                title: specialtext(
                  text: 'الاشعارات',
                  fweight: FontWeight.w500,
                  fsize: 16,
                ),
                trailing: specialtext(text: '"$time" + " " + "دقيقة"',),
                onTap: () {
                  //NavigateTo(context, Notifications());
                },
              ),
        ],
      ),
    );*/
Widget specialtext(
        {required String text,
        double fsize = 14,
        FontWeight fweight = FontWeight.w400,
        Color? fcolor = const Color(0xff161616),
        String ffamily = "ReadexPro",
        FontStyle fstyle = FontStyle.normal,
        TextAlign talign = TextAlign.start}) =>
    Text(
      text,
      style: TextStyle(
        color: fcolor,
        fontSize: fsize,
        fontWeight: fweight,
        fontFamily: ffamily,
        fontStyle: fstyle,
      ),
      overflow: TextOverflow.ellipsis,
      textAlign: talign,
    );

Widget serviceContainer({
  required String tex,
  required double width,
  required BuildContext context,
  required String texttitle,
  required String textcontent,
  Widget? page,
  BuildContext? contex,
}) =>
    Center(
      child: InkWell(
        onTap: () {
          NavigateTo(contex, page);
        },
        child: Container(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
          width: width - 16,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(blurRadius: 4, color: Color(0xff40000000))
            ],
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffffffff),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: specialtext(
                              text: texttitle,
                              fsize: 19,
                              talign: TextAlign.right),
                          content: specialtext(
                              text: textcontent, talign: TextAlign.right),
                          actionsAlignment: MainAxisAlignment.end,
                        );
                      });
                }),
                child: DefoltSvgImage(
                    image: 'assets/images/vuesax_bulk_info_circle.svg',
                    width: 32,
                    hight: 32),
              ),
              specialtext(
                text: tex,
                fweight: FontWeight.w600,
                fsize: 16,
              ),
            ],
          ),
        ),
      ),
    );
Widget defaultFormFieldReservation(
        {required TextEditingController controller,
        required TextInputType type,
        required FormFieldValidator<String>? validate,
        ValueChanged<String>? onSubmit,
        Function? onChanged,
        //required String label,
        IconData? prefix,
        IconData? suffix,
        GestureTapCallback? onTap,
        bool isPassword = false,
        VoidCallback? suffixPressed,
        double Radiu = 8,
        double fsize = 16,
        FontWeight fweight = FontWeight.w500,
        Color? fcolor = const Color(0xff009c7b),
        String ffamily = "ReadexPro",
        FontStyle fstyle = FontStyle.normal,
        required double width,
        String? hintText}) =>
    SizedBox(
      height: 40,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          print(s);
        },
        style: const TextStyle(
            color: Color(0xff161616),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        onTap: onTap,
        onChanged: onSubmit,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: fcolor,
              fontWeight: FontWeight.w400,
              fontFamily: ffamily,
              fontStyle: fstyle,
              fontSize: 14),
          suffixIcon: suffix != Null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffd8d8d8), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(Radiu)),
            //borderSide: BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: const Color(0xffffffff),
        ),
      ),
    );
Widget defaultFormFieldSetting({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String>? validate,
  ValueChanged<String>? onSubmit,
  Function? onChanged,
  //required String label,
  IconData? prefix,
  IconData? suffix,
  GestureTapCallback? onTap,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double Radiu = 8,
  double fsize = 14,
  FontWeight fweight = FontWeight.w500,
  Color? fcolor = const Color(0xff009c7b),
  String ffamily = "ReadexPro",
  FontStyle fstyle = FontStyle.normal,
  required double width,
}) =>
    Opacity(
      opacity: .5,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          print(s);
        },
        style: const TextStyle(
            color: Color(0xff161616),
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        onTap: onTap,
        onChanged: onSubmit,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          suffixIcon: suffix != Null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Radiu)),
            //borderSide: BorderSide(color: Colors.red),
          ),
          filled: true,
          fillColor: const Color(0xffffffff),
        ),
      ),
    );
Widget defaultFormField2({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator<String>? validate,
  ValueChanged<String>? onSubmit,
  Function? onChanged,
  required String label,
  IconData? prefix,
  IconData? suffix,
  GestureTapCallback? onTap,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double Radiu = 8,
  double fsize = 14,
  FontWeight fweight = FontWeight.w500,
  Color? fcolor = const Color(0xff009c7b),
  String ffamily = "ReadexPro",
  FontStyle fstyle = FontStyle.normal,
  required double width,
}) =>
    Opacity(
      opacity: .5,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          print(s);
        },
        onTap: onTap,
        onChanged: onSubmit,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: fcolor,
              fontWeight: fweight,
              fontFamily: ffamily,
              fontStyle: fstyle,
              fontSize: fsize),
          suffixIcon: suffix != Null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Radiu)),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );

Widget defaultTextButton(
        {required VoidCallback? function,
        required String text,
        double fsize = 14,
        FontWeight fweight = FontWeight.w500,
        Color? fcolor = const Color(0xff009c7b),
        String ffamily = "ReadexPro",
        FontStyle fstyle = FontStyle.normal,
        TextAlign talign = TextAlign.start}) =>
    TextButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
              color: fcolor,
              fontWeight: fweight,
              fontFamily: ffamily,
              fontStyle: fstyle,
              fontSize: fsize),
          textAlign: talign,
        ));
Widget defaultMateriaButton(
        {double width = double.infinity,
        Color backgroundColor = Colors.cyan,
        //bool isUpperCase=true,
        double height = 40.0,
        double radius = 0.0,
        required double fsize,
        required FontWeight fweight,
        required Color fcolor,
        required String text,
        required VoidCallback? function,
        String ffamily = "ReadexPro",
        FontStyle fstyle = FontStyle.normal,
        TextAlign talign = TextAlign.center}) =>
    Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius)),
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            color: fcolor,
            fontSize: fsize,
            fontWeight: fweight,
            fontFamily: ffamily,
            fontStyle: fstyle,
          ),
          textAlign: talign,
        ),
      ),
    );
Widget BottomCard({
  required Color? cardcolor,
  required VoidCallback? function,
  double widthCard = 171,
  required String text,
  required String image,
  required Color? fcolor,
  double fsize = 18,
  FontWeight fweight = FontWeight.w500,
}) =>
    InkWell(
      onTap: function,
      child: Card(
        shape: RoundedRectangleBorder(
          //<-- SEE HERE
          /*side: BorderSide(
                        color: Colors.greenAccent,
                         ),*/
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: cardcolor,
            border: Border.all(color: const Color(0xff009c7b), width: 2),
          ),
          width: widthCard,
          height: 52,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefoltSvgImage(image: image, width: 24, hight: 24),
                const SizedBox(
                  width: 4,
                ),
                specialtext(
                  text: text,
                  fweight: fweight,
                  fcolor: fcolor,
                  fsize: fsize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
Widget buttonCardBottom({
  Color? cardcolor1 = const Color(0xff009c7b),
  required VoidCallback? function1,
  required String text1,
  required String image1,
  Color? fcolor1 = const Color(0xffffffff),
  Color? cardcolor2 = const Color(0xffffffff),
  required VoidCallback? function2,
  double widthCard = 171,
  required String text2,
  required String image2,
  Color? fcolor2 = const Color(0xff009c7b),
  double fsize = 18,
  FontWeight fweight = FontWeight.w500,
  required double space,
}) =>
    Card(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding:
              EdgeInsets.only(top: 16, bottom: 32, right: space, left: space),
          child: Center(
            child: Row(
              children: [
                BottomCard(
                    cardcolor: cardcolor1,
                    function: function1,
                    text: text1,
                    image: image1,
                    fcolor: fcolor1,
                    widthCard: widthCard),
                SizedBox(
                  width: space,
                ),
                BottomCard(
                    cardcolor: cardcolor2,
                    function: function2,
                    text: text2,
                    image: image2,
                    fcolor: fcolor2,
                    widthCard: widthCard),
              ],
            ),
          ),
        ),
      ),
    );
Widget itemDropdown({
  String? day,
  String? time = '٨ صباحاً - ٤ مساءً',
}) =>
    Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            specialtext(text: '$day'),
            const Spacer(),
            specialtext(text: '$time')
          ],
        ),
      ),
    );
Widget richRequireText({
  required String tex1,
  required String tex2,
}) =>
    RichText(
      text: TextSpan(children: <TextSpan>[
        TextSpan(
          text: tex1,
          style: const TextStyle(
              color: Color(0xff161616),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
        ),
        TextSpan(
          text: tex2,
          style: const TextStyle(
              color: Color(0xff7d7d7d),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 12.0),
        ),
      ]),
    );
Widget navigationButton(
        {required String text,
        double height = 52,
        double width = double.infinity,
        VoidCallback? function}) =>
    MaterialButton(
      onPressed: function,
      height: height,
      minWidth: width,
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: specialtext(
          text: text,
          fsize: 18,
          fweight: FontWeight.w500,
          fcolor: const Color(0xffffffff),
          talign: TextAlign.center),
    );
Widget MixedText({
  required String text1,
  String text2 = "*",
}) =>
    RichText(
        text: TextSpan(children: [
      TextSpan(
          style: const TextStyle(
              color: Color(0xff7d7d7d),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          text: text1),
      TextSpan(
          style: const TextStyle(
              color: Color(0xffe11a1a),
              fontWeight: FontWeight.w500,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
          text: text2)
    ]));
Widget ContainerPicker({
  required String text,
  required IconData icon,
  required VoidCallback function,
}) =>
    Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 16),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: const Color(0xffd8d8d8)),
      ),
      child: Row(
        children: [
          specialtext(text: text, fsize: 16, talign: TextAlign.end),
          const Spacer(),
          InkWell(
            onTap: function,
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: 56,
              decoration: BoxDecoration(
                color: const Color(0xff009c7b),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                border: Border.all(color: const Color(0xff009c7b)),
              ),
              child: Icon(
                icon,
                size: 24,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ],
      ),
    );
void showToast({required String text, required toastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum toastStates { SUCCESS, ERROR, WARNING }

Color choseToastColor(toastStates state) {
  late Color color;
  switch (state) {
    case toastStates.SUCCESS:
      color = Colors.green;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

Widget SpecificDrawer(
        {required BuildContext context,
        required double screenWidth,
        required String userName,
        required String usetPhone,
        required double screenheight,
        required int notifyNumber,
        required bool darktMode,
        required bool lightMode,
        VoidCallback? darkfunction,
        VoidCallback? lightfunction,
        VoidCallback? navigyNotify,
        VoidCallback? navigyEdit}) =>
    Container(
      width: (290 / 390) * screenWidth,
      height: screenheight,
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: (224 / 844) * screenheight,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                userName,
                style: const TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "ReadexPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 21.0),
                textAlign: TextAlign.center,
              ),
              accountEmail: Text(usetPhone,
                  style: const TextStyle(
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
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/unknown.png',
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1553095066-5014bc7b7f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FsbCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&w=1000&q=80",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: notifyNumber > 0 ? const Color(0xffe9ebeb) : null,
              ),
              child: ListTile(
                selectedColor: Colors.grey,
                horizontalTitleGap: 0,
                leading: SizedBox(
                  width: 24,
                  height: 24,
                  child: DefoltSvgImage(
                      image: 'assets/images/vuesax_outline_notification.svg'),
                ),
                title: specialtext(
                  text: 'الاشعارات',
                ),
                trailing: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      notifyNumber > 0 ? const Color(0xff009c7b) : Colors.white,
                  child: specialtext(
                    text: '$notifyNumber',
                    fcolor: const Color(0xffe9ebeb),
                  ),
                ),
                onTap: navigyNotify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              selectedColor: Colors.grey,
              horizontalTitleGap: 0,
              leading: SizedBox(
                width: 24,
                height: 24,
                child: DefoltSvgImage(
                    image: 'assets/images/vuesax_outline_setting_2.svg'),
              ),
              title: specialtext(
                text: 'تعديل الملف الشخصي',
              ),
              onTap: navigyEdit,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              selectedColor: Colors.grey,
              horizontalTitleGap: 0,
              leading: SizedBox(
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
                fcolor: const Color(0xff7d7d7d),
              ),
              onTap: () {},
            ),
          ),
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              selectedColor: Colors.grey,
              horizontalTitleGap: 0,
              leading: SizedBox(
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
              leading: SizedBox(
                width: 24,
                height: 24,
                child: DefoltSvgImage(
                    image: 'assets/images/vuesax_outline_clipboard_text.svg'),
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
              leading: SizedBox(
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
          const Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ListTile(
              selectedColor: Colors.grey,
              horizontalTitleGap: 0,
              leading: SizedBox(
                width: 24,
                height: 24,
                child: DefoltSvgImage(
                    image: 'assets/images/vuesax_outline_logout.svg'),
              ),
              title: specialtext(
                text: 'تسجيل الخروج',
              ),
              onTap: () {
                LogOut(context);
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: (25 / 390) * screenWidth),
            child: Container(
              width: (242 / 390) * screenWidth,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: darktMode ? Colors.black : const Color(0xffe9e9e9),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: darkfunction,
                    child: Container(
                      width: (117 / 390) * screenWidth,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        color:
                            darktMode ? Colors.black : const Color(0xffe9e9e9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          specialtext(
                              text: 'Dark',
                              fcolor: darktMode
                                  ? Colors.orange
                                  : const Color(0xff8c8c8c),
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
                            color: darktMode
                                ? Colors.orange
                                : const Color(0xff8c8c8c),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: lightfunction,
                    child: Container(
                      width: (117 / 390) * screenWidth,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        boxShadow: const [
                          BoxShadow(color: Color(0xff40000000), blurRadius: 4),
                        ],
                        color:
                            lightMode ? const Color(0xffffffff) : Colors.black,
                        //Color(0xffffffff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          specialtext(
                              text: 'Light',
                              fcolor: lightMode
                                  ? const Color(0xff3e3e3e)
                                  : const Color(0xff8c8c8c),
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
                            color: lightMode
                                ? const Color(0xff3e3e3e)
                                : const Color(0xff8c8c8c),
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
    );
Future<void> animatedDialog({
  required BuildContext context,
  required double width,
  String title = 'تم حجز تذكرتك بنجاح',
  String massege = 'لا تقلق سوف نقوم بتذكيرك عند اقتراب دورك',
  String text1 = 'الغاء',
  String text2 = 'حسنا',
  String animation = 'done',
  required Widget screen,
  Color color = const Color(0xff009c7b),
}) =>
    Dialogs.materialDialog(
        titleAlign: TextAlign.center,
        msgAlign: TextAlign.center,
        dialogWidth: width,
        color: Colors.white,
        msg: massege,
        title: title,
        msgStyle: const TextStyle(
          fontSize: 20,
          color: Color(0xff161616),
          fontStyle: FontStyle.normal,
          fontFamily: "ReadexPro",
          fontWeight: FontWeight.w400,
        ),
        titleStyle: TextStyle(
            fontSize: 27,
            color: color,
            fontStyle: FontStyle.normal,
            fontFamily: "ReadexPro",
            fontWeight: FontWeight.w500),
        lottieBuilder: Lottie.asset(
          'assets/animation/$animation.json',
          fit: BoxFit.contain,
        ),
        context: context,
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: text1,
            textStyle: const TextStyle(color: mainColor),
            iconColor: mainColor,
          ),
          IconsButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Directionality(
                          textDirection: TextDirection.rtl, child: screen)),
                  (route) => false);
            },
            text: text2,
            color: mainColor,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.white,
          ),
        ]);
Widget Navigation2Button() => MaterialButton(
      color: const Color(0xff009c7b),
      minWidth: double.infinity,
      height: 52,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.repeat,
              color: Color(0xffffffff),
            ),
            const SizedBox(
              width: 8,
            ),
            specialtext(
                text: 'اعادة الحجز',
                fsize: 18,
                fweight: FontWeight.w500,
                fcolor: const Color(0xffffffff),
                talign: TextAlign.center)
          ],
        ),
      ),
    );
Widget timeRemain({int hours = 0, int munets = 0}) => SlideCountdown(
      duration: Duration(hours: hours, minutes: munets),
      textStyle: const TextStyle(
        color: Color(0xff161616),
        fontWeight: FontWeight.w400,
        fontFamily: "ReadexPro",
        fontStyle: FontStyle.normal,
        fontSize: 14.0,
      ),
      separatorStyle: const TextStyle(
        color: Color(0xff161616),
      ),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
    );
Widget linearIndicator(
        {required double width, int hours = 0, int munets = 0}) =>
    ProgressBarAnimation(
        width: width,
        height: 8,
        duration: Duration(hours: hours, minutes: munets),
        gradient: const LinearGradient(
          colors: [
            Color(0xffbceee3),
            mainColor,
          ],
        ),
        backgroundColor: Colors.grey.withOpacity(0.4));
