//IPv4 Address. . . . . . . . . . . : 192.168.56.1
String localhost = "192.168.15.97:5000";
String port = "5000";

//login and register
String UserLoginUrl = "http://$localhost/api/v1/user/login";
String AgencyLoginUrl = "http://$localhost/api/v1/agency/login";
String UserRegisterUrl = "http://$localhost/api/user/register";
String AgencyRegisterUrl = "http://$localhost/api/agency/register";

//homeimages
String gethomepageimages = "http://$localhost/api/v1/homepage/images";

//homepackagesall
String getallhomepagepackages = "http://$localhost/api/v1/homepage/";

String offerlist1url = "http://$localhost/api/v1/homepage/";
String offerlist1ur2 = "http://$localhost/api/v1/homepage/";
String offerlist1ur3 = "http://$localhost/api/v1/homepage/";

String bookpageurl = "http://$localhost/api/v1/book/";

//user functionality
String SearchPackagesurl = "http://$localhost:$port/api/packages/search";
String PackagesDetailbyid = "http://$localhost:$port/api/packages/detail";
String BookPackage = "http://$localhost:$port/api/packages/book";
String AddTocartpackages = "http://$localhost:$port/api/packages/addtocart";
String Packageshistory = "http://$localhost:$port/api/packages/history";
String ReviewPackages = "http://$localhost:$port/api/packages/review";

//agency add/delete/mpdify package
String AddPackages = "http://$localhost:$port/api/packages/add";
String ModifyPackages = "http://$localhost:$port/api/packages/modify";
String DeletePackages = "http://$localhost:$port/api/packages/delete";

//All Admin functionality
String AdminLoginUrl = "http://$localhost:$port/api/admin/login";
String RemoveAgencyurl = "http://$localhost:$port/api/admin/removeagency";
String AdminDeletePackagesurl =
    "http://$localhost:$port/api/admin/deletepackage";
