import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/model/bankmodels/all_banks_model/all_banks_model.dart';
import 'package:tabor/modules/branshes/branshes.dart';
import 'package:tabor/modules/queue/queue.dart';
import 'package:tabor/modules/service/service.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/componants/iconsax_icons.dart';

import '../../model/favoret_model/favoret_model.dart';

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
            color: const Color(0xffffffff),
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
              color: const Color(0xff161616),
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
          borderSide: BorderSide(color: Colors.red),
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
              color: Color(0xffbceee3),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            icon,
            color: Color.fromARGB(255, 10, 90, 12),
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
              NavigateTo(context, BranshesScreen());
            },
            child: Container(
              width: width,
              height: hight,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image(
                  image: NetworkImage(model.image ??
                      'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text('${model.name}',
              style: const TextStyle(
                  color: const Color(0xff161616),
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
          NavigateTo(context, const BranshesScreen());
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                        image: NetworkImage(model.image ??
                            'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png'))),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                      style: const TextStyle(
                          color: const Color(0xff161616),
                          fontWeight: FontWeight.w500,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.right),
                  Text("${model.branchs!.length}" + ' ' + 'فرع',
                      style: const TextStyle(
                          color: const Color(0xff161616),
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
          NavigateTo(context, const BranshesScreen());
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(blurRadius: 4, color: Color(0xff40000000))
                    ]),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                        image: NetworkImage(model.image ??
                            'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png'))),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${model.name}',
                      style: const TextStyle(
                          color: const Color(0xff161616),
                          fontWeight: FontWeight.w500,
                          fontFamily: "ReadexPro",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.right),
                  Text("${model.branchs!.length}" + ' ' + 'فرع',
                      style: const TextStyle(
                          color: const Color(0xff161616),
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
        required String text}) =>
    Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [BoxShadow(color: Color(0xff40000000))],
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            specialtext(
              text: text,
              fweight: FontWeight.w600,
              fsize: 21,
            ),
            Spacer(),
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.search_normal_14),
            SizedBox(
              width: 16,
            ),
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.location5)
          ],
        ),
      ),
    );

Widget AppBar2(
        {required double screenHight,
        required double screenWidth,
        required String text,
        required BuildContext context}) =>
    Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
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
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.location5),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            DefoltIcon(width: 40, hight: 40, icon: Iconsax.search_normal_14),
            Spacer(),
            specialtext(
                text: text,
                fsize: 21,
                fcolor: Color(0xff009c7b),
                fweight: FontWeight.w600),
            SizedBox(
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
  required String name,
  required double destance,
}) =>
    Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: InkWell(
          onTap: () {
            NavigateTo(context, QueuesScreen());
          },
          child: Container(
            width: screenWidth - 32,
            height: 81,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color(0xffffffff),
              boxShadow: [BoxShadow(color: Color(0xff40000000), blurRadius: 4)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  DefoltSvgImage(image: image),
                  SizedBox(
                    width: screenWidth * 0.34,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              color: const Color(0xff161616),
                              fontWeight: FontWeight.w500,
                              fontFamily: "ReadexPro",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                          textAlign: TextAlign.right),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text("كم",
                              style: const TextStyle(
                                  color: const Color(0xff161616),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.right),
                          Text(" " + "$destance",
                              style: const TextStyle(
                                  color: const Color(0xff161616),
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
          color: Color(0xffffffff),
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
                      color: const Color(0xff161616),
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
                        return AlertDialog(
                          title: Opacity(
                            opacity: 0.699999988079071,
                            child: Text("الاوراق المطلوبة",
                                style: const TextStyle(
                                    color: const Color(0xff161616),
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
                    color: const Color(0xff161616),
                    fontWeight: FontWeight.w500,
                    fontFamily: "ReadexPro",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0),
                textAlign: TextAlign.right),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text("$time" + " " + "دقيقة",
                style: const TextStyle(
                    color: const Color(0xff161616),
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
          padding: EdgeInsets.only(right: 16, left: 16, top: 12, bottom: 12),
          width: width - 16,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 4, color: Color(0xff40000000))],
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffffffff),
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
    Container(
      height: 40,
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          print(s);
        },
        style: TextStyle(
            color: const Color(0xff161616),
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
          fillColor: Color(0xffffffff),
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
        style: TextStyle(
            color: const Color(0xff161616),
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
          fillColor: Color(0xffffffff),
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
            borderSide: BorderSide(color: Colors.red),
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
            border: Border.all(color: Color(0xff009c7b), width: 2),
          ),
          width: widthCard,
          height: 52,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefoltSvgImage(image: image, width: 24, hight: 24),
                SizedBox(
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
            Spacer(),
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
          style: TextStyle(
              color: Color(0xff161616),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
        ),
        TextSpan(
          text: tex2,
          style: TextStyle(
              color: const Color(0xff7d7d7d),
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
    InkWell(
        onTap: function,
        /*(){
                      /*  NavigateTo(context,Directionality(textDirection: TextDirection.rtl,
                        child: layoutScreen())
                         );*/
                  },*/
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Color(0xff009c7b),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: specialtext(
                text: text,
                fcolor: Color(0xffffffff),
                fsize: 18,
                fweight: FontWeight.w500),
          ),
        ));
Widget MixedText({
  required String text1,
  String text2 = "*",
}) =>
    RichText(
        text: TextSpan(children: [
      TextSpan(
          style: const TextStyle(
              color: const Color(0xff7d7d7d),
              fontWeight: FontWeight.w400,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          text: text1),
      TextSpan(
          style: const TextStyle(
              color: const Color(0xffe11a1a),
              fontWeight: FontWeight.w500,
              fontFamily: "ReadexPro",
              fontStyle: FontStyle.normal,
              fontSize: 18.0),
          text: text2)
    ]));
Widget ContainerPicker({
  //required String text,
  required TextEditingController myController,
  required IconData icon,
  required VoidCallback function,
  required FormFieldValidator<String>? validate,
}) =>
    Container(
      height: 48,
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(start: 16),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: const Color(0xffd8d8d8)),
      ),
      child: Row(
        children: [
          TextFormField(
            readOnly: true,
            controller: myController,
            validator: validate,
          ),
          const Spacer(),
          InkWell(
            onTap: function,
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: 56,
              decoration: BoxDecoration(
                color: Color(0xff009c7b),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                border: Border.all(color: const Color(0xff009c7b)),
              ),
              child: Icon(
                icon,
                size: 24,
                color: Color(0xffffffff),
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
