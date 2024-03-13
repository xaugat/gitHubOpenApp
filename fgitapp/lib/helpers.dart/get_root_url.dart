import 'package:fgitapp/main.dart';
import 'package:fgitapp/utils/api_constants.dart';

String getRootUrl(BuildFlavor buildFlavor) {
  // you can add various baseurls according to your flavor
  switch (buildFlavor) {
    case BuildFlavor.dev:
      return ApiUrls.appBaseUrl;

    case BuildFlavor.live:
      return ApiUrls.appBaseUrl;

    default:
      return ApiUrls.appBaseUrl;
  }
}
