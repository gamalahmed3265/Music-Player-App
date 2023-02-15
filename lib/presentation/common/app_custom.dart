
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

AppBar AppCustom(){
    return AppBar(
      title: const Text("Music Player App"),
      actions: [
        IconButton(onPressed: ()async{

        }, icon: const Icon(Icons.search))
      ],
      leading: const Icon(Icons.sort_rounded),
    );
  }
