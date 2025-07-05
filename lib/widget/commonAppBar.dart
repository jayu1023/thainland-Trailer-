import 'package:flutter/material.dart';

import '../utils/appColors.dart';

getCommonAppBar(String text, bool centerTiltle) {
  return AppBar(
    
    centerTitle: centerTiltle ?? false,
    title: Text(
      "$text",
      style: TextStyle(color: Colors.black),
    ),
  );
}
