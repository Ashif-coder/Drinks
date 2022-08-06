import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/controller.dart';
import '../const.dart';
import '../model/Drinks_item_model.dart';


class DrinkDetail extends StatelessWidget {
 final Title ;
  final  Category ;
  final  alco ;
  final  image ;
  final  content  ;

  const DrinkDetail({Key? key,required this.image,required this.content,required this.alco, required this.Category, required this.Title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    String description = "Lorem rem ipsum dolor sit amet, consectetur adipiscing elit";

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image ?? defaultImagePath,),
                  fit: BoxFit.cover,
                  opacity: 0.7),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(

              color: Colors.white,
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  yellowColor.withOpacity(0.0),
                  yellowShadowColor.withOpacity(0.5),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24,40,24,20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: blackColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      size: 24,
                      color: whiteColor,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      Title,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                            color: whiteTextColor
                        ),
                      ),
                    ),
                    const SizedBox(height: 80,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Category,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: whiteTextColor
                            ),
                          ),
                        ),

                        Text(
                          alco,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: whiteTextColor

                            ),
                          ),
                        ),
                      ],),
                    const SizedBox(height: 16),
                    SizedBox(
                      height:description.length > 800 ? 300 : null,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          content ?? "",
                          style: GoogleFonts.robotoSlab(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: whiteTextColor

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
