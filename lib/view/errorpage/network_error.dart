import 'package:drinks/view/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drinks/view/component/gradientbutton.dart';


class NetworkError extends StatelessWidget {


  const NetworkError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
              ),
              Center(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("asset/images/networkerror.png")),
              ),
              Center(
                child: Text(
                  'Network error',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  width: 150,
                  child: GradientButton(
                    function: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Home();
                          },
                        ),
                            (_) => false,
                      );
                    },
                    title: "Retry",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
