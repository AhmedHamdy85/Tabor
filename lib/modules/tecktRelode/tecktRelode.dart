import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class tecketReloudeScreen extends StatelessWidget {
  const tecketReloudeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Color(0xff40000000),
                    //  blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
          ),
          LayoutBuilder(builder: (context, constranes) {
            return Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    (constranes.constrainWidth() / 10).floor(),
                    (index) => SizedBox(
                          width: 5,
                          height: 2,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey)),
                        )));
          }),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff40000000),
                    blurStyle: BlurStyle.outer,
                    //  blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
        ],
      ),
    ));
  }
}
