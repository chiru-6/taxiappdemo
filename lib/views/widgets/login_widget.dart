import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxiappdemo/utils/app_constants.dart';
import 'package:taxiappdemo/views/otp_verification_screen.dart';
import 'package:taxiappdemo/views/widgets/text_widget.dart';

Widget loginWidget(
    CountryCode countryCode, Function onCountryChange, Function onSubmit) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: AppConstants.helloNiceToMeetYou),
        textWidget(
            text: AppConstants.getMovingWithGreenTaxi,
            fontSize: 22,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () => onCountryChange(),
                    child: Container(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Container(
                            child: countryCode.flagImage(),
                          )),
                          textWidget(text: countryCode.dialCode),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  )),
              Container(
                width: 1,
                height: 55,
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    onSubmitted: (String? input) => onSubmit(input),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppConstants.enterMobileNumber,
                      hintStyle: GoogleFonts.poppins(
                        // color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: AppConstants.byCreating + " ",
                  ),
                  TextSpan(
                    text: AppConstants.termsOfService + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "and "),
                  TextSpan(
                    text: AppConstants.privacyPolicy + " ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        )
      ],
    ),
  );
}
