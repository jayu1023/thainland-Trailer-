import 'package:url_launcher/url_launcher.dart';

class Socials {
  static List<String> youtube_video_links = <String>[
    "https://www.youtube.com/watch?v=DEdV-yq7KG8",
    "https://www.youtube.com/watch?v=3WvD9oRUpFc",
    "https://www.youtube.com/watch?v=YJd6tGgfJmU",
    "https://www.youtube.com/watch?v=beCHqr-TGcM",
    "https://www.youtube.com/watch?v=CjmyjmJV4uQ",
    "https://www.youtube.com/watch?v=h6rqcRPfMro",
    "https://www.youtube.com/watch?v=DdqQmW-1PRY",
    "https://www.youtube.com/watch?v=DEdV-yq7KG8",
    "https://www.youtube.com/watch?v=ZMHp7qXT5lk",
    "https://www.youtube.com/watch?v=ynRkoBM-vJc",
    "https://www.youtube.com/watch?v=ZSyZYgD_Sx0",
    "https://www.youtube.com/watch?v=xOfQWVEDMyQ",
    "https://www.youtube.com/watch?v=JZbOvXc118I",
    "https://www.youtube.com/watch?v=GHlhuX3VE_s",
    "https://www.youtube.com/watch?v=LFtKns3Txmk",
    "https://www.youtube.com/watch?v=Eo9_BcZDqFU",
  ];
  static int length_youtube_links = youtube_video_links.length - 1;
  static var intsagram = "https://www.instagram.com/mr.joker_1023/";

  static bool instagram_on = false;

  static bool subscribe_Channel_on = true;
  static bool subsribe_on_tapping_channel = false;
  static String subs_channel_endPoints = "?sub_confirmation=1";

  static String channel_url = "https://www.youtube.com/@toilet847";

  static void onTapYT() async {
    if (subsribe_on_tapping_channel) {
      if (!await launchUrl(
          Uri.parse("${channel_url}${subs_channel_endPoints}"))) {
        throw Exception(
            'Could not launch ${channel_url}${subs_channel_endPoints}');
      }
    } else {
      if (!await launchUrl(Uri.parse("${channel_url}"))) {
        throw Exception('Could not launch ${channel_url}');
      }
    }
  }
}
