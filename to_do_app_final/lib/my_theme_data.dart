import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:to_do_app_final/app_colors.dart';

class MyThemeData {
  static final ThemeData LightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundLightColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
    bottomSheetTheme: BottomSheetThemeData(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side:const BorderSide(
        color:AppColors.primaryColor,
        width:2
      )
    )),  
           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          shape:StadiumBorder(
            side:BorderSide(
              color: AppColors.whiteColor,
              width: 6
            )
          ),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(35),
          //     side: BorderSide(color: AppColors.whiteColor, width: 6))),
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
       bodyMedium: GoogleFonts.poppins(
        fontSize:18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
       bodySmall: GoogleFonts.poppins(
        fontSize:14,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      )));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundDarkColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primaryColor,
        showUnselectedLabels: false,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          shape:StadiumBorder(
            side:BorderSide(
              color: AppColors.whiteColor,
              width: 6
            )
          ),
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(35),
          //     side: BorderSide(color: AppColors.whiteColor, width: 6))),
      ),
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.blackDarkColor,
      ),  
         bodyMedium: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
       bodySmall: GoogleFonts.poppins(
        fontSize:14,
        fontWeight: FontWeight.w300,
        color: AppColors.blackColor,
      )));
}
