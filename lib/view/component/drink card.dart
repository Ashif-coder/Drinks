import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drinks/const.dart';

class DrinkCard extends StatefulWidget {
  var title;
  var path;
  var category;
  VoidCallback onClick;
  DrinkCard(
      {Key? key,
      this.title = "NEWS TITLE",
      this.path = "IMAGE PATH",
      this.category,
      required this.onClick})
      : super(key: key);

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft),
          onPressed: widget.onClick,
          child: Container(
            height: 92,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: yellowShadowColor,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.path),
                            //AssetImage('asset/images/student_image.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          // SizedBox(height: 10,),
                          Text(
                            widget.category,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
