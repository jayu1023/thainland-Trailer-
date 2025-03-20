class AdsControllerModel {
  String? _id;
  String? _homeNativePosition;
  String? _intCount;

  AdsControllerModel(
      {String? id, String? homeNativePosition, String? intCount}) {
    if (id != null) {
      this._id = id;
    }
    if (homeNativePosition != null) {
      this._homeNativePosition = homeNativePosition;
    }
    if (intCount != null) {
      this._intCount = intCount;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get homeNativePosition => _homeNativePosition;
  set homeNativePosition(String? homeNativePosition) =>
      _homeNativePosition = homeNativePosition;
  String? get intCount => _intCount;
  set intCount(String? intCount) => _intCount = intCount;

  AdsControllerModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _homeNativePosition = json['homeNativePosition'];
    _intCount = json['int_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['homeNativePosition'] = this._homeNativePosition;
    data['int_count'] = this._intCount;
    return data;
  }
}
