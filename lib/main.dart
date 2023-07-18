/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';
import 'package:tabor/modules/queue/cubit/queue_logic.dart';
import 'package:tabor/shared/network/local/cashe_helper.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import 'layout/layout_screen.dart';
import 'modules/login/cubit/logic.dart';
import 'shared/componants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();
  DioHelper.init();
  String? token = CasheHelper.getData(Key: 'token');
  String? id = CasheHelper.getData(Key: 'id');
  String? refreshToken = CasheHelper.getData(Key: 'refreshToken');
  print('token$token');
  print('userid' '$id');
  // print('refresh' + refreshToken);
  Widget widget;
  if (token?.isNotEmpty == true) {
    widget = layoutScreen();
  } else {
    widget = onBoardingScreen();
  }
  runApp(MyApp(
    key: UniqueKey(),
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => layoutCubit()
            ..getAllBanks()
            ..getFavoretBanks()
            ..getActiveTeckit()
            ..getCompletedTeckit()
            ..getUserData(id!),
        ),
        BlocProvider(
          create: (context) => QueueCubit()
            ..getQueues()
            ..getServices(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffE9EBEB),
          primarySwatch: Colors.green,
          fontFamily: 'ReadexPro',
        ),
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: startWidget,
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/logic.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';
import 'package:tabor/modules/queue/cubit/queue_logic.dart';
import 'package:tabor/shared/network/local/cashe_helper.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import 'layout/layout_screen.dart';
import 'modules/login/cubit/logic.dart';
import 'shared/componants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();
  DioHelper.init();
  token = CasheHelper.getData(Key: 'token');
  id = CasheHelper.getData(Key: 'id');
  refreshToken = CasheHelper.getData(Key: 'refreshToken');
  print('token$token');
  print('userid' '$id');
  // print('refresh' + refreshToken);
  Widget widget;
  if (token.isNotEmpty) {
    widget = const layoutScreen();
  } else {
    widget = const onBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => layoutCubit()
              ..getAllBanks()
              ..getFavoretBanks()
              ..getActiveTeckit()
              ..getCompletedTeckit()
              ..getUserData(id)),
        BlocProvider(
            create: (context) => QueueCubit()
              ..getQueues()
              ..getServices()),
        BlocProvider(create: (context) => LoginCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffE9EBEB),
          primarySwatch: Colors.green,
          fontFamily: 'ReadexPro',
        ),
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl, child: startWidget),
      ),
    );
  }
}
//AIzaSyCIxWs7y17aInfgssjCKvJPP8IFritbcg4
/*
class MyDropdownWidget extends StatefulWidget {
  @override
  _MyDropdownWidgetState createState() => _MyDropdownWidgetState();
}

class _MyDropdownWidgetState extends State<MyDropdownWidget> {
   String? _selectedValue;
   GlobalKey _dropdownKey = GlobalKey();
  List<DropdownOption> _options = [
    DropdownOption('option1', 'Option 1'),
    DropdownOption('option2', 'Option 2'),
    DropdownOption('option3', 'Option 3'),
  ];
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: _selectedValue,
        items: _options.map((option) {
          return DropdownMenuItem(
            value: option.value,
            child: Container(
              color: _selectedValue == option.value ? Colors.green : null,
              width: 150,
              child: RadioListTile(
                title: Text(option.label),
                value: option.value,
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value ;
                  });
                },
                activeColor: Colors.green, // Set the background color of selected RadioListTile
                toggleable: true, // Allow selecting and deselecting the currently selected option
              ),
            ),
            onTap: () {
              setState(() {
                _selectedValue = option.value;
              // Manually set the selected value when the item is tapped
              });
            },
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedValue = value ;
          });
        },
      ),
    );
  }
}
class DropdownOption {
  final String value;
  final String label;

  DropdownOption(this.value, this.label);
}
 */
