class ApiEndPoints {
  static const String baseUrl = "https://bus.colonapps.in/ModBusThailand";
  static const String baseImageUrl = "${baseUrl}/images/";
  static const String baseImageLiveryUrl =
      "https://bus.colonapps.in/ModBusThailand/livery/";
  static const String baseDownloadModUrl = "${baseUrl}/file/";
  static const String getBusesData =
      "${baseUrl}ModBusThailand/subCategoryWithNineData.php?type=bus&pack=0";
  static const String getDetails = "${baseUrl}";

  // /subCategoryWith4.php?type=$type&pack=$pack&to=4&from=$from
}
