import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:statemixin_tutorial/statemanagement/statemanagement.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key key,
    @required this.makeupModel,
  }) : super(key: key);
  final MakeupModel makeupModel;

  String formatDate(String date) {
    return DateFormat('MM/dd/yyyy').format(DateTime.tryParse(date));
  }

  Color getColor(String color) =>
      Color(int.tryParse("0xFF${color.replaceAll('#', '')}"));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Buy Now',
          style: context.textTheme.headline5,
        ),
        backgroundColor: Colors.black,
        onPressed: () async {
          try {
            await launch(makeupModel.productLink);
          } catch (e) {
            Get.snackbar(
              'Error',
              e.toString(),
              backgroundColor: context.theme.errorColor,
              colorText: Colors.white,
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text(
          makeupModel.name,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MakeUpImage(
              makeUp: makeupModel,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Brand: ${makeupModel.brand}',
                    style: context.textTheme.headline6,
                  ),
                  _buildSpacer(),
                  Text(
                    'Type: ${makeupModel.productType}',
                    style: context.textTheme.headline6,
                  ),
                  _buildSpacer(),
                  Text(
                    'Price: \$${makeupModel.price}',
                    style: context.textTheme.headline6,
                  ),
                  _buildSpacer(),
                  Text(
                    'Price: \$${makeupModel.price}',
                    style: context.textTheme.headline6,
                  ),
                  _buildSpacer(),
                  Text(
                    makeupModel.description,
                    style: context.textTheme.bodyText2,
                  ),
                  _buildSpacer(),
                  makeupModel.productColors != null &&
                          makeupModel.productColors.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSpacer(),
                            Text(
                              'Available Colors',
                              style: context.textTheme.headline6,
                            ),
                            _buildSpacer(),
                            Wrap(
                              children: makeupModel.productColors
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8.0,
                                      ),
                                      child: CircleAvatar(
                                        // width: 50,
                                        // height: 50,
                                        backgroundColor: getColor(e.hexValue),

                                        // child: Text("${e.colorName}"),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSpacer() => SizedBox(
        height: 10,
      );
}
