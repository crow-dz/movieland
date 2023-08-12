

import 'package:flutter/material.dart';

class buttontrans extends StatelessWidget {
 final   IconData  ico; 
  const buttontrans({
    Key? key,
    required this.ico
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color:const Color.fromARGB(0, 255, 255, 255).withOpacity(0.1),
          borderRadius:  BorderRadius.circular(5),
        ),
        child: Icon(
        ico
         /*  Icons.arrow_back */,
          color: Colors.white,
        ),);
  }
}
