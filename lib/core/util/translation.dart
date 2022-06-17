class TranslationModel {
  late String home;
  late String cart;
  late String categories;
  late String settings;
  late String logoutConfirmation;
  late String profile;
  late String cancel;
  late String yes;
  late String userLogin;
  late String emailAddress;
  late String password;
  late String confirmPassword;
  late String dontHaveAccount;
  late String newAccount;
  late String createUserAccount;
  late String enterYourEmail;
  late String enterYourPassword;
  late String fullName;
  late String pleaseEnter;
  late String phone;
  late String address;
  late String right;
  late String select;
  late String alexandria;
  late String cairo;
  late String giza;
  late String qalyubia;
  late String portSaid;
  late String suez;
  late String gharbia;
  late String dakahlia;
  late String ismailia;
  late String asyut;
  late String fayoum;
  late String sharqia;
  late String aswan;
  late String beheira;
  late String minya;
  late String damietta;
  late String luxor;
  late String qena;
  late String beniSuef;
  late String sohag;
  late String monufia;
  late String redSea;
  late String kafrElSheikh;
  late String northSinai;
  late String matruh;
  late String newValley;
  late String arabic;
  late String english;
  late String mode;
  late String lightMode;
  late String darkMode;
  late String language;
  late String aboutUs;
  late String connectUs;
  late String help;
  late String logOut;
  late String partners;
  late String termsOfUse;
  late String myOrders;
  late String myPoints;
  late String allProducts;
  late String productPoints;
  late String addToCart;
  late String viewAll;
  late String displayDevices;
  late String desktopComputers;
  late String videoGaming;
  late String cellularDevices;
  late String myItems;
  late String howToUse;
  late String orderNumber;
  late String orderDate;
  late String orderStatus;
  late String orderPoints;
  late String quantity;
  late String totalPoint;
  late String productName;
  late String productCategory;
  late String productDescription;
  late String productVideoUrl;
  late String notAvailable;
  late String addToCartSuccessfully;
  late String order;
  late String orderDetails;
  late String madeOrderSuccessfully;
  late String aboutUsDescription;
  late String howToUseDescription;




  TranslationModel.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    cart = json['cart'];
    categories = json['categories'];
    settings = json['settings'];
    logoutConfirmation = json['logoutConfirmation'];
    profile = json['profile'];
    cancel = json['cancel'];
    yes = json['yes'];
    userLogin = json['userLogin'];
    emailAddress = json['emailAddress'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    dontHaveAccount = json['dontHaveAccount'];
    newAccount = json['newAccount'];
    createUserAccount = json['createUserAccount'];
    enterYourEmail = json['enterYourEmail'];
    enterYourPassword = json['enterYourPassword'];
    fullName = json['fullName'];
    pleaseEnter = json['pleaseEnter'];
    phone = json['phone'];
    address = json['address'];
    right = json['right'];
    select = json['select'];
    alexandria = json['alexandria'];
    cairo = json['cairo'];
    giza = json['giza'];
    qalyubia = json['qalyubia'];
    portSaid = json['portSaid'];
    suez = json['suez'];
    gharbia = json['gharbia'];
    dakahlia = json['dakahlia'];
    ismailia = json['ismailia'];
    asyut = json['asyut'];
    fayoum = json['fayoum'];
    sharqia = json['sharqia'];
    aswan = json['aswan'];
    beheira = json['beheira'];
    minya = json['minya'];
    damietta = json['damietta'];
    luxor = json['luxor'];
    qena = json['qena'];
    beniSuef = json['beniSuef'];
    sohag = json['sohag'];
    monufia = json['monufia'];
    redSea = json['redSea'];
    kafrElSheikh = json['kafrElSheikh'];
    northSinai = json['northSinai'];
    matruh = json['matruh'];
    newValley = json['newValley'];
    arabic = json['arabic'];
    english = json['english'];
    mode = json['mode'];
    darkMode = json['darkMode'];
    lightMode = json['lightMode'];
    language = json['language'];
    aboutUs = json['aboutUs'];
    connectUs = json['connectUs'];
    help = json['help'];
    logOut = json['logOut'];
    partners = json['partners'];
    termsOfUse = json['termsOfUse'];
    myPoints = json['myPoints'];
    myOrders = json['myOrders'];
    allProducts = json['allProduct'];
    addToCart = json['addToCart'];
    productPoints = json['productPoints'];
    viewAll = json['viewAll'];
    displayDevices = json['displayDevices'];
    desktopComputers = json['desktopComputers'];
    videoGaming = json['videoGaming'];
    cellularDevices = json['cellularDevices'];
    myItems = json['myItems'];
    howToUse = json['howToUse'];
    orderNumber = json['orderNumber'];
    orderDate = json['orderDate'];
    orderStatus = json['orderStatus'];
    orderPoints = json['orderPoints'];
    quantity = json['quantity'];
    totalPoint = json['totalPoint'];
    productName = json['productName'];
    productCategory = json['productCategory'];
    productDescription = json['productDescription'];
    productVideoUrl = json['productVideoUrl'];
    notAvailable = json['notAvailable'];
    addToCartSuccessfully = json['addToCartSuccessfully'];
    order = json['order'];
    madeOrderSuccessfully = json['madeOrderSuccessfully'];
    orderDetails = json['orderDetails'];
    aboutUsDescription = json['aboutUsDescription'];
    howToUseDescription = json['howToUseDescription'];
  }

  Map toJson() => {
        'home': home,
        'cart': cart,
        'categories': categories,
        'settings': settings,
        'logoutConfirmation': logoutConfirmation,
        'profile': profile,
        'cancel': cancel,
        'yes': yes,
        'userLogin': userLogin,
        'emailAddress': emailAddress,
        'password': password,
        'confirmPassword': confirmPassword,
        'dontHaveAccount': dontHaveAccount,
        'newAccount': newAccount,
        'createUserAccount': createUserAccount,
        'enterYourEmail': enterYourEmail,
        'enterYourPassword': enterYourPassword,
        'fullName': fullName,
        'pleaseEnter': pleaseEnter,
        'phone': phone,
        'address': address,
        'right': right,
        'select': select,
        'alexandria': alexandria,
        'cairo': cairo,
        'giza': giza,
        'qalyubia': qalyubia,
        'portSaid': portSaid,
        'suez': suez,
        'gharbia': gharbia,
        'dakahlia': dakahlia,
        'ismailia': ismailia,
        'asyut': asyut,
        'fayoum': fayoum,
        'sharqia': sharqia,
        'aswan': aswan,
        'beheira': beheira,
        'minya': minya,
        'damietta': damietta,
        'luxor': luxor,
        'qena': qena,
        'beniSuef': beniSuef,
        'sohag': sohag,
        'monufia': monufia,
        'redSea': redSea,
        'kafrElSheikh': kafrElSheikh,
        'northSinai': northSinai,
        'matruh': matruh,
        'newValley': newValley,
        'arabic': arabic,
        'english': english,
        'mode': mode,
        'lightMode': lightMode,
        'darkMode': darkMode,
        'language': language,
        'aboutUs': aboutUs,
        'connectUs': connectUs,
        'help': help,
        'howToUse': howToUse,
        'logOut': logOut,
        'partners': partners,
        'termsOfUse': termsOfUse,
        'myPoints': myPoints,
        'myOrders': myOrders,
        'allProduct': allProducts,
        'addToCart': addToCart,
        'productPoints': productPoints,
        'viewAll': viewAll,
        'displayDevices': displayDevices,
        'desktopComputers': desktopComputers,
        'videoGaming': videoGaming,
        'cellularDevices': cellularDevices,
        'myItems': myItems,
        'orderNumber': orderNumber,
        'orderDate': orderDate,
        'orderStatus': orderStatus,
        'orderPoints': orderPoints,
        'quantity': quantity,
        'totalPoint': totalPoint,
        'productName': productName,
        'productCategory': productCategory,
        'productDescription': productDescription,
        'productVideoUrl': productVideoUrl,
        'notAvailable': notAvailable,
        'addToCartSuccessfully': addToCartSuccessfully,
        'order': order,
        'madeOrderSuccessfully': madeOrderSuccessfully,
        'orderDetails': orderDetails,
        'aboutUsDescription': aboutUsDescription,
        'howToUseDescription': howToUseDescription,

  };
}
