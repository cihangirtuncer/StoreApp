import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class HomeDetailTitleWidget extends StatelessWidget {
   final String stateName;
  final String title;
  const HomeDetailTitleWidget({Key? key, required this.stateName, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("$title:",
                        style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(
                          " ${stateName}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
  }
}