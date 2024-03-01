//IPv4 Address. . . . . . . . . . . : 192.168.56.1
String localhost = "192.168.56.1";
int port = 5000;

//login and register
String UserLoginUrl = "http://$localhost:$port/api/user/login";
String UserRegisterUrl = "http://$localhost:$port/api/user/register";
String AgencyLogin = "http://$localhost:$port/api/agency/login";
String AgencyRegister = "http://$localhost:$port/api/agency/register";

//packages
String gethomepageimages = "http://$localhost:$port/api/packages/homepage";
String featuredpackagetagdandimagedetailurl =
    "http://$localhost:$port/api/packages/featured";
String offersection1packages =
    "http://$localhost:$port/api/packages/offersection1";
String offersection2packages =
    "http://$localhost:$port/api/packages/offersection2";
String offersection3packages =
    "http://$localhost:$port/api/packages/offersection3";

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


