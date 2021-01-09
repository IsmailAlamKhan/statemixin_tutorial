import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemixin_tutorial/statemanagement/statemanagement.dart';
import 'package:statemixin_tutorial/ui/pages/detailpage.dart';

class Home extends GetView<MakeUpController> {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make up'),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: context.theme.dividerColor,
          ),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final MakeupModel makeUp = state[index];
            return ListTile(
              onTap: () => Get.to(
                DetailsPage(
                  makeupModel: makeUp,
                ),
              ),
              title: Text(makeUp.name),
              trailing: Text("\$${makeUp.price}"),
              leading: MakeUpImage(makeUp: makeUp),
            );
          },
        ),
      ),
    );
  }
}

class MakeUpImage extends StatelessWidget {
  const MakeUpImage({
    Key key,
    @required this.makeUp,
  }) : super(key: key);

  final MakeupModel makeUp;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(makeUp.imageLink),
    );
  }
}
