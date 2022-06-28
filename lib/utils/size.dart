import 'dart:ui';

import 'package:flutter/material.dart';

class BaseSize{
  static Size getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }
}