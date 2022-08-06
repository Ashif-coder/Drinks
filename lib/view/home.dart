import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:drinks/view/errorpage/network_error.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../const.dart';
import '../controller/controller.dart';
import '../model/Drinks_item_model.dart';
import 'component/drink card.dart';
import 'package:animations/animations.dart';
import 'detail.dart';
import 'errorpage/wrong.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List dataItems = [];
  bool showsppinning= false;
  void populate() {
    Future.delayed(Duration.zero, () async {
      Provider.of<MyProvider>(context, listen: false).showSpinningStat(true);
      bool result = await InternetConnectionChecker().hasConnection;
      Stage? stage;
      if(result == true) {
         stage = await Provider.of<MyProvider>(context, listen: false).fetchDrink();
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NetworkError()));
      }

      if (stage == Stage.ERROR) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Wrong()));
        Provider.of<MyProvider>(context, listen: false).showSpinningStat(false);
      } else if (stage == Stage.NETWORKERROR) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NetworkError()));
        Provider.of<MyProvider>(context, listen: false).showSpinningStat(false);
      } else {
        Provider.of<MyProvider>(context, listen: false).showSpinningStat(false);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    populate();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final provider = Provider.of<MyProvider>(context);
    dataItems = provider.drink;
    showsppinning = provider.showSpinner;

  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      //inAsyncCall: true,
      opacity: 1,
      color: Colors.white,
     inAsyncCall: showsppinning,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:yellowColor,
          title: Center(
            child: Text(
              "Your Drinks",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  letterSpacing: 3.0,
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                  // color: whiteColor
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                  decoration:
                  kTextFieldDecoration.copyWith(
                    hintText: "Search",
                    suffixIcon:
                    const Icon(Icons.search_rounded),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 30.0),
                  ),
                  onChanged:(value){
                    Provider.of<MyProvider>(context, listen: false).changeSearchString(value);
                  }
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    itemCount: dataItems.length,
                    itemBuilder: (context, index) => OpenContainer(
                      closedColor: whiteColor,
                      openColor: whiteColor,
                      transitionDuration: const Duration(milliseconds: 600),
                        openBuilder: (context, _) => DrinkDetail(index: index,),
                        closedBuilder: (context, VoidCallback openContainer) {
                          DrinksItemModel data = dataItems[index];
                          return DrinkCard(
                            title: data.strDrink,
                            category: data.strCategory,
                            path: data.strDrinkThumb ?? defaultImagePath,
                            onClick:openContainer
                          );
                        }),

                    //
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
