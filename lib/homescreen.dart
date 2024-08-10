import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/layouts/container_demo.dart';
import 'package:llp_flutter_learning_app/layouts/row_column_demo.dart';
import 'package:llp_flutter_learning_app/layouts/wrap_demo.dart';
import 'package:llp_flutter_learning_app/previewscreen.dart';
import 'package:llp_flutter_learning_app/widgets/button_demo.dart';
import 'package:llp_flutter_learning_app/widgets/dropdown_demo.dart';
import 'package:llp_flutter_learning_app/widgets/global_key_example.dart';
import 'package:llp_flutter_learning_app/widgets/icon_demo.dart';
import 'package:llp_flutter_learning_app/widgets/image_demo.dart';
import 'package:llp_flutter_learning_app/widgets/key_example.dart';
import 'package:llp_flutter_learning_app/widgets/other_stateful_widgets_demo.dart';
import 'package:llp_flutter_learning_app/widgets/text_demo.dart';
import 'package:llp_flutter_learning_app/widgets/textfield_demo.dart';
import 'package:llp_flutter_learning_app/widgets/textformfield_demo.dart';
import 'package:llp_flutter_learning_app/widgets/typography_demo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildTitle(String title, List<Widget> subtitle) {
      return Card(
          elevation: 8,
          color: Colors.white,
          surfaceTintColor: Colors.green,
          child: ExpansionTile(
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            leading: Icon(Icons.star_border),
            title: Text(title),
            children: subtitle,
          )
      );
    }

    Widget buildSubtitle(String subtitle, Widget demo, String path){
      return ListTile(
        leading: Icon(Icons.check),
        title: Text(subtitle),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PreviewScreen(title: subtitle, demo: demo, path: path,))
          );
        },
        trailing: Icon(Icons.chevron_right),
      );
    }

    final List<Widget> widgets = [
      buildSubtitle('Icon', IconDemo(), 'widgets/icon_demo.dart'),
      buildSubtitle('Text', TextDemo(), 'widgets/text_demo.dart'),
      buildSubtitle('Typography', TypographyDemo(), 'widgets/typography_demo.dart'),
      buildSubtitle('Button', ButtonDemo(), 'widgets/button_demo.dart'),
      buildSubtitle('TextFeild', TextfieldDemo(), 'widgets/textfield_demo.dart'),
      buildSubtitle('TextFormFeild', TextformfieldDemo(), 'widgets/textformfield_demo.dart'),
      buildSubtitle('Image', ImageDemo(), 'widgets/image_demo.dart'),
      buildSubtitle('Dropdown & Menu', DropdownDemo(), 'widgets/dropdown_demo.dart'),
      buildSubtitle('Other Stateful Widgets', OtherStatefulWidgets(), 'widgets/other_stateful_widgets_demo.dart'),
      buildSubtitle('Flutter Keys', KeyExample(), 'widgets/key_example.dart'),
      buildSubtitle('Flutter Global Keys', GlobalKeyExample(), 'widgets/global_key_example.dart'),
    ];

    final List<Widget> layouts = [
      buildSubtitle('Container', ContainerDemo(), 'layouts/container_demo.dart'),
      buildSubtitle('Row & Column', RowColumnDemo(), 'layouts/row_column_demo.dart'),
      buildSubtitle('Wrap', WrapDemo(), 'layouts/wrap_demo.dart'),
      buildSubtitle('FactionallySizedBox', Placeholder(), ''),
      buildSubtitle('Expanded', Placeholder(), ''),
      buildSubtitle('Stack', Placeholder(), ''),
    ];

    final List<Widget> lists = [
      buildSubtitle('ListTile', const Placeholder(),''),
      buildSubtitle('ListView.builder()', const Placeholder(),''),
      buildSubtitle('GridView', const Placeholder(),''),
      buildSubtitle('ExpansionTile', const Placeholder(),''),
      buildSubtitle('Swipe To Dismiss', const Placeholder(),''),
      buildSubtitle('ReorderableListView', const Placeholder(),''),
      buildSubtitle('SlidableListTile', const Placeholder(),''),
      buildSubtitle('Data Table', const Placeholder(),''),
    ];

    final List<Widget> appbars = [
      buildSubtitle('Basic AppBar', const Placeholder(),''),
      buildSubtitle('BottomAppBar & FAB', const Placeholder(),''),
      buildSubtitle('Sliver AppBar', const Placeholder(),''),
      buildSubtitle('Backdrop', const Placeholder(),''),
      buildSubtitle('ConvexAppBar', const Placeholder(),''),
      buildSubtitle('HidableBottomNavBar', const Placeholder(),''),
      buildSubtitle('SearchBar', const Placeholder(),''),
    ];
    
    final List<Widget> navigations = [
      buildSubtitle('Tabs', Placeholder(), ''),
      buildSubtitle('Dialogs', Placeholder(), ''),
      buildSubtitle('Drawers', Placeholder(), ''),
      buildSubtitle('BottomSheet', Placeholder(), ''),
      buildSubtitle('BottomTabBar', Placeholder(), ''),
      buildSubtitle('BottomNavBar', Placeholder(), ''),
      buildSubtitle('Page Selector', Placeholder(), ''),
      buildSubtitle('DraggableScrollableSheet', Placeholder(), ''),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Flutter Learning Catalog'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildTitle('Widgets', widgets),
                buildTitle('Layouts', layouts),
                buildTitle('Lists', lists),
                buildTitle('Appbars', appbars),
                buildTitle('Navigations', navigations),
              ],
            ),
          ),
        ));
  }
}
