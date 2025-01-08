// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'dimens.dart';
// //22
// TextStyle get largeStyle {
//   return GoogleFonts.inter(
//       textStyle: TextStyle(fontSize: AppDimens.large.sp, color: Colors.black));
// }
// //20
// TextStyle get mediumStyle {
//   return GoogleFonts.inter(
//       textStyle: TextStyle(fontSize: AppDimens.medium.sp, color: Colors.black));
// }
// //17
// TextStyle get normalStyle {
//   return GoogleFonts.inter(
//       textStyle: TextStyle(fontSize: AppDimens.normal.sp, color: Colors.black));
// }
// //15
// TextStyle get smallStyle {
//   return GoogleFonts.inter(
//       textStyle: TextStyle(fontSize: AppDimens.small.sp, color: Colors.black));
// }
// //14
// TextStyle get miniStyle {
//   return GoogleFonts.inter(
//       textStyle: TextStyle(fontSize: AppDimens.mini.sp, color: Colors.black));
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dimens.dart';

mixin AppDimens {
  static const double tiny = 12.0;
  static const double mini = 14.0;
  static const double small = 16.0;
  static const double normal = 18.0;
  static const double medium = 20.0;
  static const double large = 22.0;
  static const double big = 24.0;
  static const double veryBig = 26.0;
}

class AppTextStyles {
  static final TextStyle tinyStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.tiny.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle miniStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.mini.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle smallStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.small.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle normalStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.normal.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle mediumStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.medium.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle largeStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.large.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle bigStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.big.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle veryBigStyle = GoogleFonts.poppins(
    textStyle: TextStyle(fontSize: AppDimens.veryBig.sp, color: Colors.black, letterSpacing: 1),
  );
}

class InRiaTextStyles {
  static final TextStyle tinyStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.tiny.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle miniStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.mini.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle smallStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.small.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle normalStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.normal.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle mediumStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.medium.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle largeStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.large.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle bigStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.big.sp, color: Colors.black, letterSpacing: 1),
  );

  static final TextStyle veryBigStyle = GoogleFonts.inriaSerif(
    textStyle: TextStyle(fontSize: AppDimens.veryBig.sp, color: Colors.black, letterSpacing: 1),
  );
}
