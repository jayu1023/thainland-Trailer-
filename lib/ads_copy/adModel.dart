class adModel {
  AppData? appData;
  AdData? adData;

  adModel({this.appData, this.adData});

  adModel.fromJson(Map<String, dynamic> json) {
    appData =
        json['AppData'] != null ? new AppData.fromJson(json['AppData']) : null;
    adData =
        json['AdData'] != null ? new AdData.fromJson(json['AdData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appData != null) {
      data['AppData'] = this.appData!.toJson();
    }
    if (this.adData != null) {
      data['AdData'] = this.adData!.toJson();
    }
    return data;
  }
}

class AppData {
  Review? review;
  AppStringsData? appStringsData;
  DownloadBehaviour? downloadBehaviour;

  AppData({this.review, this.appStringsData, this.downloadBehaviour});

  AppData.fromJson(Map<String, dynamic> json) {
    review =
        json['review'] != null ? new Review.fromJson(json['review']) : null;
    appStringsData = json['appStringsData'] != null
        ? new AppStringsData.fromJson(json['appStringsData'])
        : null;
    downloadBehaviour = json['downloadBehaviour'] != null
        ? new DownloadBehaviour.fromJson(json['downloadBehaviour'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.review != null) {
      data['review'] = this.review!.toJson();
    }
    if (this.appStringsData != null) {
      data['appStringsData'] = this.appStringsData!.toJson();
    }
    if (this.downloadBehaviour != null) {
      data['downloadBehaviour'] = this.downloadBehaviour!.toJson();
    }
    return data;
  }
}

class Review {
  bool? initStatus;
  bool? reviewLink;
  int? setMinDaysBeforeRemind;
  int? setMinDaysAfterInstall;
  int? setMinLaunchTimes;
  int? setMinSecondsBeforeShowDialog;
  bool? initUpgradeEnabled;

  Review(
      {this.initStatus,
      this.reviewLink,
      this.setMinDaysBeforeRemind,
      this.setMinDaysAfterInstall,
      this.setMinLaunchTimes,
      this.setMinSecondsBeforeShowDialog,
      this.initUpgradeEnabled});

  Review.fromJson(Map<String, dynamic> json) {
    initStatus = json['init_status'];
    reviewLink = json['review_link'];
    setMinDaysBeforeRemind = json['setMinDaysBeforeRemind'];
    setMinDaysAfterInstall = json['setMinDaysAfterInstall'];
    setMinLaunchTimes = json['setMinLaunchTimes'];
    setMinSecondsBeforeShowDialog = json['setMinSecondsBeforeShowDialog'];
    initUpgradeEnabled = json['init_upgrade_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['init_status'] = this.initStatus;
    data['review_link'] = this.reviewLink;
    data['setMinDaysBeforeRemind'] = this.setMinDaysBeforeRemind;
    data['setMinDaysAfterInstall'] = this.setMinDaysAfterInstall;
    data['setMinLaunchTimes'] = this.setMinLaunchTimes;
    data['setMinSecondsBeforeShowDialog'] = this.setMinSecondsBeforeShowDialog;
    data['init_upgrade_enabled'] = this.initUpgradeEnabled;
    return data;
  }
}

class AppStringsData {
  String? appName;
  String? privacyPolicy;
  String? appSupport;
  String? shareUs;
  String? termsAndConditions;
  String? howToInstall;

  AppStringsData(
      {this.appName,
      this.privacyPolicy,
      this.appSupport,
      this.shareUs,
      this.termsAndConditions,
      this.howToInstall});

  AppStringsData.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    privacyPolicy = json['privacy_policy'];
    appSupport = json['app_support'];
    shareUs = json['share_us'];
    termsAndConditions = json['Terms_and_Conditions'];
    howToInstall = json['how_to_install'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['privacy_policy'] = this.privacyPolicy;
    data['app_support'] = this.appSupport;
    data['share_us'] = this.shareUs;
    data['Terms_and_Conditions'] = this.termsAndConditions;
    data['how_to_install'] = this.howToInstall;
    return data;
  }
}

class DownloadBehaviour {
  String? sComent;
  int? type;

  DownloadBehaviour({this.sComent, this.type});

  DownloadBehaviour.fromJson(Map<String, dynamic> json) {
    sComent = json['_coment'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_coment'] = this.sComent;
    data['type'] = this.type;
    return data;
  }
}

class AdData {
  AdIdConfig? adIdConfig;
  NativeAd? nativeAd;
  OnBak? onBak;
  BannerAd? bannerAd;
  IndAd? indAd;
  RewardAd? rewardAd;
  AppOpenAd? appOpenAd;
  SpalshAdData? spalshAdData;

  AdData(
      {this.adIdConfig,
      this.nativeAd,
      this.onBak,
      this.bannerAd,
      this.indAd,
      this.rewardAd,
      this.appOpenAd,
      this.spalshAdData});

  AdData.fromJson(Map<String, dynamic> json) {
    adIdConfig = json['adIdConfig'] != null
        ? new AdIdConfig.fromJson(json['adIdConfig'])
        : null;
    nativeAd = json['NativeAd'] != null
        ? new NativeAd.fromJson(json['NativeAd'])
        : null;
    onBak = json['onBak'] != null ? new OnBak.fromJson(json['onBak']) : null;
    bannerAd = json['BannerAd'] != null
        ? new BannerAd.fromJson(json['BannerAd'])
        : null;
    indAd = json['indAd'] != null ? new IndAd.fromJson(json['indAd']) : null;
    rewardAd = json['rewardAd'] != null
        ? new RewardAd.fromJson(json['rewardAd'])
        : null;
    appOpenAd = json['appOpenAd'] != null
        ? new AppOpenAd.fromJson(json['appOpenAd'])
        : null;
    spalshAdData = json['spalshAdData'] != null
        ? new SpalshAdData.fromJson(json['spalshAdData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adIdConfig != null) {
      data['adIdConfig'] = this.adIdConfig!.toJson();
    }
    if (this.nativeAd != null) {
      data['NativeAd'] = this.nativeAd!.toJson();
    }
    if (this.onBak != null) {
      data['onBak'] = this.onBak!.toJson();
    }
    if (this.bannerAd != null) {
      data['BannerAd'] = this.bannerAd!.toJson();
    }
    if (this.indAd != null) {
      data['indAd'] = this.indAd!.toJson();
    }
    if (this.rewardAd != null) {
      data['rewardAd'] = this.rewardAd!.toJson();
    }
    if (this.appOpenAd != null) {
      data['appOpenAd'] = this.appOpenAd!.toJson();
    }
    if (this.spalshAdData != null) {
      data['spalshAdData'] = this.spalshAdData!.toJson();
    }
    return data;
  }
}

class AdIdConfig {
  G? g;
  G? f;
  G? u;
  Q? q;

  AdIdConfig({this.g, this.f, this.u, this.q});

  AdIdConfig.fromJson(Map<String, dynamic> json) {
    g = json['G'] != null ? new G.fromJson(json['G']) : null;
    f = json['F'] != null ? new G.fromJson(json['F']) : null;
    u = json['U'] != null ? new G.fromJson(json['U']) : null;
    q = json['Q'] != null ? new Q.fromJson(json['Q']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.g != null) {
      data['G'] = this.g!.toJson();
    }
    if (this.f != null) {
      data['F'] = this.f!.toJson();
    }
    if (this.u != null) {
      data['U'] = this.u!.toJson();
    }
    if (this.q != null) {
      data['Q'] = this.q!.toJson();
    }
    return data;
  }
}

class G {
  String? appId;
  bool? status;
  String? sComment;
  String? onFailedNative;
  String? onFailedBanner;
  String? onFailedInd;
  String? onFailedReward;

  G(
      {this.appId,
      this.status,
      this.sComment,
      this.onFailedNative,
      this.onFailedBanner,
      this.onFailedInd,
      this.onFailedReward});

  G.fromJson(Map<String, dynamic> json) {
    appId = json['app_id'];
    status = json['status'];
    sComment = json['_comment'];
    onFailedNative = json['onFailedNative'];
    onFailedBanner = json['onFailedBanner'];
    onFailedInd = json['onFailedInd'];
    onFailedReward = json['onFailedReward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_id'] = this.appId;
    data['status'] = this.status;
    data['_comment'] = this.sComment;
    data['onFailedNative'] = this.onFailedNative;
    data['onFailedBanner'] = this.onFailedBanner;
    data['onFailedInd'] = this.onFailedInd;
    data['onFailedReward'] = this.onFailedReward;
    return data;
  }
}

class Q {
  bool? status;
  List<AdsQureka>? adsQureka;

  Q({this.status, this.adsQureka});

  Q.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['AdsQureka'] != null) {
      adsQureka = <AdsQureka>[];
      json['AdsQureka'].forEach((v) {
        adsQureka!.add(new AdsQureka.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.adsQureka != null) {
      data['AdsQureka'] = this.adsQureka!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdsQureka {
  bool? status;
  String? imageUrl;
  String? logoUrl;
  String? name;
  String? title;
  String? btnText;
  String? loadurl;

  AdsQureka(
      {this.status,
      this.imageUrl,
      this.logoUrl,
      this.name,
      this.title,
      this.btnText,
      this.loadurl});

  AdsQureka.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    imageUrl = json['imageUrl'];
    logoUrl = json['logoUrl'];
    name = json['name'];
    title = json['title'];
    btnText = json['btnText'];
    loadurl = json['loadurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['imageUrl'] = this.imageUrl;
    data['logoUrl'] = this.logoUrl;
    data['name'] = this.name;
    data['title'] = this.title;
    data['btnText'] = this.btnText;
    data['loadurl'] = this.loadurl;
    return data;
  }
}

class NativeAd {
  bool? status;
  String? adSize;
  String? admobNativeId;
  int? counter;
  String? fbNativeId;
  List<String>? adArray;
  bool? onFailed;
  String? innerFixedAd;
  bool? innerFixedAppEnabled;
  int? nativeArrayLength;
  List<int>? screens;

  NativeAd(
      {this.status,
      this.adSize,
      this.admobNativeId,
      this.counter,
      this.fbNativeId,
      this.adArray,
      this.onFailed,
      this.innerFixedAd,
      this.innerFixedAppEnabled,
      this.nativeArrayLength,
      this.screens});

  NativeAd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adSize = json['ad_size'];
    admobNativeId = json['admob_native_id'];
    counter = json['counter'];
    fbNativeId = json['fb_native_id'];
    adArray = json['ad_Array'].cast<String>();
    onFailed = json['onFailed'];
    innerFixedAd = json['innerFixedAd'];
    innerFixedAppEnabled = json['innerFixedAppEnabled'];
    nativeArrayLength = json['native_array_length'];
    screens = json['screens'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ad_size'] = this.adSize;
    data['admob_native_id'] = this.admobNativeId;
    data['counter'] = this.counter;
    data['fb_native_id'] = this.fbNativeId;
    data['ad_Array'] = this.adArray;
    data['onFailed'] = this.onFailed;
    data['innerFixedAd'] = this.innerFixedAd;
    data['innerFixedAppEnabled'] = this.innerFixedAppEnabled;
    data['native_array_length'] = this.nativeArrayLength;
    data['screens'] = this.screens;
    return data;
  }
}

class OnBak {
  bool? status;
  int? counter;
  List<String>? adArray;
  String? sComment;
  List<int>? screens;

  OnBak({this.status, this.counter, this.adArray, this.sComment, this.screens});

  OnBak.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    counter = json['counter'];
    adArray = json['Ad_array'].cast<String>();
    sComment = json['_comment'];
    screens = json['screens'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['counter'] = this.counter;
    data['Ad_array'] = this.adArray;
    data['_comment'] = this.sComment;
    data['screens'] = this.screens;
    return data;
  }
}

class BannerAd {
  bool? status;
  String? admobBannerId;
  String? fbBannerId;
  String? ad;
  bool? onFailed;
  String? sComment;
  List<int>? screens;

  BannerAd(
      {this.status,
      this.admobBannerId,
      this.fbBannerId,
      this.ad,
      this.onFailed,
      this.sComment,
      this.screens});

  BannerAd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    admobBannerId = json['admob_banner_id'];
    fbBannerId = json['fb_banner_id'];
    ad = json['ad'];
    onFailed = json['onFailed'];
    sComment = json['_comment'];
    screens = json['screens'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['admob_banner_id'] = this.admobBannerId;
    data['fb_banner_id'] = this.fbBannerId;
    data['ad'] = this.ad;
    data['onFailed'] = this.onFailed;
    data['_comment'] = this.sComment;
    data['screens'] = this.screens;
    return data;
  }
}

class IndAd {
  bool? status;
  String? admobIndId;
  String? fbIndId;
  List<String>? adArray;
  bool? onFailed;
  int? counter;
  String? sComment;
  List<int>? screens;

  IndAd(
      {this.status,
      this.admobIndId,
      this.fbIndId,
      this.adArray,
      this.onFailed,
      this.counter,
      this.sComment,
      this.screens});

  IndAd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    admobIndId = json['admob_ind_id'];
    fbIndId = json['fb_ind_id'];
    adArray = json['ad_array'].cast<String>();
    onFailed = json['onFailed'];
    counter = json['counter'];
    sComment = json['_comment'];
    screens = json['screens'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['admob_ind_id'] = this.admobIndId;
    data['fb_ind_id'] = this.fbIndId;
    data['ad_array'] = this.adArray;
    data['onFailed'] = this.onFailed;
    data['counter'] = this.counter;
    data['_comment'] = this.sComment;
    data['screens'] = this.screens;
    return data;
  }
}

class RewardAd {
  bool? status;
  int? counter;
  String? admobRewardId;
  String? fbRewardId;
  List<String>? adArray;
  bool? onFailed;
  String? sComment;
  List<int>? functions;

  RewardAd(
      {this.status,
      this.counter,
      this.admobRewardId,
      this.fbRewardId,
      this.adArray,
      this.onFailed,
      this.sComment,
      this.functions});

  RewardAd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    counter = json['counter'];
    admobRewardId = json['admob_reward_id'];
    fbRewardId = json['fb_reward_id'];
    adArray = json['ad_array'].cast<String>();
    onFailed = json['onFailed'];
    sComment = json['_comment'];
    functions = json['functions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['counter'] = this.counter;
    data['admob_reward_id'] = this.admobRewardId;
    data['fb_reward_id'] = this.fbRewardId;
    data['ad_array'] = this.adArray;
    data['onFailed'] = this.onFailed;
    data['_comment'] = this.sComment;
    data['functions'] = this.functions;
    return data;
  }
}

class AppOpenAd {
  bool? status;
  String? adId;
  String? ad;
  bool? adShowAfterQureka;

  AppOpenAd({this.status, this.adId, this.ad, this.adShowAfterQureka});

  AppOpenAd.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adId = json['ad_id'];
    ad = json['Ad'];
    adShowAfterQureka = json['adShowAfterQureka'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['ad_id'] = this.adId;
    data['Ad'] = this.ad;
    data['adShowAfterQureka'] = this.adShowAfterQureka;
    return data;
  }
}

class SpalshAdData {
  bool? status;
  String? sComment;
  int? ad;

  SpalshAdData({this.status, this.sComment, this.ad});

  SpalshAdData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sComment = json['_comment'];
    ad = json['Ad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_comment'] = this.sComment;
    data['Ad'] = this.ad;
    return data;
  }
}
