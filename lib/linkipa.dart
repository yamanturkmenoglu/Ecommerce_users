class Applink {
  static const String server = "https://yamanturkmenoglu.online/eticaret";
  static const String test = "$server/test.php";
  static const String imageststatic =
      "http://yamanturkmenoglu.online/eticaret/upload";
  //login

  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verfiycode.php";
  //forgetpassword
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
  //HOME
  static const String homepage = "$server/home.php";
  static const String homepage2 = "$server/homerand.php";
  static const String homeTopselling = "$server/topsilling.php";
  //image
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagesitems = "$imageststatic/items";
  //items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

  // favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefrommyfavorite =
      "$server/favorite/deletefromfavorite.php";

  // cart
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String cartView = "$server/cart/view.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";
  //address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressRemove = "$server/address/remove.php";
  //coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  // checkout
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarshive = "$server/orders/arshive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String notification = "$server/notification.php";
  static const String rating = "$server/rating.php";
}
