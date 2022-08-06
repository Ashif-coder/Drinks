import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback? function;
  const GradientButton({
    Key? key,this.title="Button Name",@required this.function
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function!,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<
            RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36.0),
          ),
        ),
        elevation: MaterialStateProperty.all(0.0),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
      child: Ink(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffAA60C5),
                Color(0xffFA0000)
              ]),
          borderRadius:
          BorderRadius.all(Radius.circular(36.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight:
              50.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child:  Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,

              ),),
          ),
        ),
      ),
    );
  }
}
