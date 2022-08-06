// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:drinks/const.dart';
// import 'package:drinks/model/data_model.dart';
// import 'package:provider/provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
//
// import '../../controller/controller.dart';
// import '../webview.dart';
//
// class NewsDetail extends StatefulWidget {
//   final int index;
//
//   const NewsDetail({Key? key,required this.index}) : super(key: key);
//
//   @override
//   State<NewsDetail> createState() => _NewsDetailState();
// }
//
// class _NewsDetailState extends State<NewsDetail> {
// late Article dataArticle;
// var formatter = new DateFormat('yyyy-MM-dd');
// var headLine ;
// var sourceName ;
// var date ;
// var image ;
// var content  ;
// var url;
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//      final provider = Provider.of<MyProvider>(context);
//     dataArticle =provider.drinks[widget.index];
//     print(dataArticle.urlToImage);
//     headLine = dataArticle.title;
//     sourceName = dataArticle.source.name;
//     date = formatter.format(DateTime.parse(dataArticle.publishedAt));
//     image = dataArticle.urlToImage;
//     content = dataArticle.content;
//     url =dataArticle.url;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String description = "Lorem rem ipsum dolor sit amet, consectetur adipiscing elit";
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(image==null ? defaultImagePath : image,),
//                   fit: BoxFit.cover,
//                   opacity: 0.7),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//
//               color: Colors.white,
//               gradient: LinearGradient(
//                 begin: FractionalOffset.topCenter,
//                 end: FractionalOffset.bottomCenter,
//                 colors: [
//                   Colors.grey.withOpacity(0.0),
//                   Colors.black,
//                 ],
//                 stops: const [0.0, 1.0],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(24,40,24,20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   style: TextButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       minimumSize: Size(50, 30),
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       alignment: Alignment.centerLeft),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Container(
//                     height: 42,
//                     width: 42,
//                     decoration: BoxDecoration(
//                       color: blackColor.withOpacity(0.5),
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: Icon(
//                       Icons.arrow_back_rounded,
//                       size: 24,
//                       color: whiteColor,
//                     ),
//                   ),
//                 ),
//                Column(
//                  children: [
//                    TextButton(
//                      onPressed: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewNewsSite( link: url,)));
//                      },
//                      child: Text(
//                        headLine,
//                        style: GoogleFonts.robotoSlab(
//                          textStyle: const TextStyle(
//                              fontSize: 29,
//                              fontWeight: FontWeight.w800,
//                              color: greyTitleColor
//                          ),
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 80,),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                      Text(
//                        sourceName,
//                        style: GoogleFonts.robotoSlab(
//                          textStyle: const TextStyle(
//                              fontSize: 20,
//                              fontWeight: FontWeight.w400,
//                              color: greyTitleColor
//                          ),
//                        ),
//                      ),
//
//                      Text(
//                        date,
//                        style: GoogleFonts.robotoSlab(
//                          textStyle: const TextStyle(
//                              fontSize: 20,
//                              fontWeight: FontWeight.w400,
//                              color: greyTitleColor
//
//                          ),
//                        ),
//                      ),
//                    ],),
//                    SizedBox(height: 16),
//                    Container(
//                      height:description.length > 800 ? 300 : null,
//                      child: SingleChildScrollView(
//                        physics: BouncingScrollPhysics(),
//                        child: Text(
//                        content==null ? "" : content,
//                          style: GoogleFonts.robotoSlab(
//                            textStyle: const TextStyle(
//                                fontSize: 14,
//                                fontWeight: FontWeight.w400,
//                                color: greyTitleColor
//
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
