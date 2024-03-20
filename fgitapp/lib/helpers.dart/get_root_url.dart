import 'package:fgitapp/app_builder.dart';
import 'package:fgitapp/common/constants/api_constants.dart';

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
