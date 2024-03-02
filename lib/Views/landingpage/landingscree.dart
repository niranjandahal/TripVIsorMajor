import 'package:flutter/material.dart';
import 'package:tripvisormajor/Widgets/HomeFullScreenShow.dart';
import 'package:tripvisormajor/Components/customtext.dart';
import 'package:tripvisormajor/Components/navcomponent.dart';
import 'package:tripvisormajor/Widgets/customdrawer.dart';
import 'package:tripvisormajor/Widgets/footer.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection1.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection2.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection3.dart';
import 'package:tripvisormajor/Widgets/tagsandads.dart';
import 'package:tripvisormajor/Widgets/searchbar.dart';
import 'package:go_router/go_router.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  // Controllers
  late ScrollController _scrollController;

  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }

  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            toolbarHeight: 60,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height,
            iconTheme: IconThemeData(color: Colors.white),
            // backgroundColor: Color.fromARGB(255, 90, 93, 247),
            backgroundColor: Color(0xFF5A5DF7),
            // backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              background: HomeFullScreenShow(),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1),
                      alignment: Alignment.centerLeft,
                      child: customText('TripVisor', 20,
                          color: Colors.white, weight: FontWeight.bold)),
                  Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.15),
                      child: customsearchbar()),
                  Container(
                    child: Row(
                      children: [
                        navcomponent('Destinations', 1),
                        navcomponent('packages', 2),
                        navcomponent('Custom plan', 3),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          width: 125,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFFFC454),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "SignIn  ▼",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              onPressed: () {
                                //2 option register as user or agent
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: customText('Signin as: ', 16),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              title: customText('User', 14),
                                              onTap: () {
                                                GoRouter.of(context)
                                                    .go('/Register');
                                              },
                                            ),
                                            ListTile(
                                              title: customText('Agency', 14),
                                              onTap: () {
                                                GoRouter.of(context)
                                                    .go('/Login');
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 20,
            ),
            WebSmoothScroll(
              controller: _scrollController,
              scrollOffset: 60, // additional offset to users scroll input
              animationDuration:
                  500, // duration of animation of scroll in milliseconds
              curve: Curves.easeInOutCirc, // curve of the animation
              child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      TagDisplay(),
                      OfferSection1(),
                      OfferSection2(),
                      OfferSection3(),
                      CustomFooter(),
                    ],
                  )),
            ),
          ])),
        ],
      ),
    );
  }
}
