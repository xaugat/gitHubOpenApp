import 'package:fgitapp/common/constants/app_colors_constant.dart';
import 'package:fgitapp/common/constants/string_constants.dart';
import 'package:fgitapp/common/widgets/base_page_widget.dart';
import 'package:flutter/material.dart';

class ShowErrorPage extends StatefulWidget {
  const ShowErrorPage({Key? key}) : super(key: key);

  @override
  State<ShowErrorPage> createState() => _ShowErrorPageState();
}

class _ShowErrorPageState extends State<ShowErrorPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.error),
            Text(ResString.pageNotFound),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: ElevatedButton(
                  child: Text(ResString.goBack),
                  onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}
