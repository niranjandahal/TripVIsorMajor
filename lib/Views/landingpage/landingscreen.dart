import 'package:flutter/material.dart';
import 'package:tripvisormajor/Widgets/HomeFullScreenShow.dart';
import 'package:tripvisormajor/Components/customtext.dart';
import 'package:tripvisormajor/Widgets/footer.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection1.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection2.dart';
import 'package:tripvisormajor/Widgets/offersection/offersection3.dart';
import 'package:tripvisormajor/Widgets/tagsandads.dart';
import 'package:tripvisormajor/Widgets/searchbar.dart';
import 'package:go_router/go_router.dart';
import 'package:tripvisormajor/entity/Agency/agencypanel.dart';
import 'package:tripvisormajor/entity/user/userprofile.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';
import 'package:provider/provider.dart';
import 'package:tripvisormajor/provider/userorAgencyProvider.dart';
import 'package:tripvisormajor/provider/offersectionprovider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final offersectionprovider _offersectionprovider = offersectionprovider();

  // Controllers
  late ScrollController _scrollController;

  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();
    _offersectionprovider.loadOfferList1();
    _offersectionprovider.loadOfferList2();
    _offersectionprovider.loadOfferList3();
    super.initState();
  }

  // Remove the unused field
  // String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
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
                    child: customsearchbar(),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            context.go('/Destinations');
                          },
                          child: Text(
                            'Destinations',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            context.go('/Packages');
                          },
                          child: Text(
                            'Packages',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        //UuserorAgencyProvider isanylogin true then person icon else container
                        Consumer<userAgencyProvider>(
                          builder: (context, userorAgencyProvider, child) {
                            return userorAgencyProvider.isanylogin
                                ? Container(
                                    //person icon
                                    margin: EdgeInsets.only(right: 5),

                                    child: IconButton(
                                        icon: Icon(Icons.person),
                                        onPressed: () {
                                          userorAgencyProvider.isUserlogin
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserProfile()))
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AgencyPanel()));
                                        }),
                                  )
                                : Container(
                                    margin: EdgeInsets.only(right: 5),
                                    width: 125,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFFFC454),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          "SignIn  ▼",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        onPressed: () {
                                          //2 option register as user or agent
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: customText(
                                                      'Signin as: ', 16),
                                                  content: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ListTile(
                                                        title: customText(
                                                            'User', 14),
                                                        onTap: () {
                                                          context.go(
                                                              '/UserSignIn');
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: customText(
                                                            'Agency', 14),
                                                        onTap: () {
                                                          context.go(
                                                              '/AgencySignIn');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        }),
                                  );
                          },
                        ),

                        ///end of the navbar
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
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TagDisplay(),
                        OfferSection1(),
                        OfferSection2(title: "Popular Packages"),
                        OfferSection3(
                          title: "Trending Packages",
                        ),
                        CustomFooter(),
                      ],
                    ),
                  )),
            ),
          ])),
        ],
      ),
    );
  }
}
