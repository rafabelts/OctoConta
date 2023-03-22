import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class OctoDialogTheme {
  OctoDialogTheme._();
  static DialogTheme lightDialog = DialogTheme(
    backgroundColor: fondoColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0.r)),
    alignment: Alignment.center,
  );
}
