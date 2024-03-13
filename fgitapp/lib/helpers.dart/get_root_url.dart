import 'package:fgitapp/common/constants/api_constants.dart';
import 'package:fgitapp/main.dart';

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
