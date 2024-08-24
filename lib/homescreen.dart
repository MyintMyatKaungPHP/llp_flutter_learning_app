import 'package:flutter/material.dart';
import 'package:llp_flutter_learning_app/appbars/backdrop_demo.dart';
import 'package:llp_flutter_learning_app/appbars/bottom_appbar_demo.dart';
import 'package:llp_flutter_learning_app/appbars/convex_bottom_bar_demo.dart';
import 'package:llp_flutter_learning_app/appbars/hidable_bottom_appbar_demo.dart';
import 'package:llp_flutter_learning_app/appbars/searchbar_demo.dart';
import 'package:llp_flutter_learning_app/appbars/sliver_appbar_demo.dart';
import 'package:llp_flutter_learning_app/layouts/container_demo.dart';
import 'package:llp_flutter_learning_app/layouts/expanded_demo.dart';
import 'package:llp_flutter_learning_app/lists/datatable_demo.dart';
import 'package:llp_flutter_learning_app/lists/gridview_builder_demo.dart';
import 'package:llp_flutter_learning_app/lists/listview_builder_demo.dart';
import 'package:llp_flutter_learning_app/layouts/row_column_demo.dart';
import 'package:llp_flutter_learning_app/layouts/stack_demo.dart';
import 'package:llp_flutter_learning_app/layouts/wrap_demo.dart';
import 'package:llp_flutter_learning_app/lists/list_tile_demo.dart';
import 'package:llp_flutter_learning_app/lists/reorderable_listview_demo.dart';
import 'package:llp_flutter_learning_app/lists/slidable_listtile_demo.dart';
import 'package:llp_flutter_learning_app/lists/swipe_to_dismiss_demo.dart';
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

import 'layouts/fractionally_sizebox_demo.dart';

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
      buildSubtitle('FractionallySizedBox', FractionallySizeboxDemo(), 'layouts/fractionally_sizebox.dart'),
      buildSubtitle('Expanded', ExpandedDemo(), 'layouts/expended_demo.dart'),
      buildSubtitle('Stack', StackDemo(), 'layouts/stack_deom.dart'),
    ];

    final List<Widget> lists = [
      buildSubtitle('ListTile', ListTileDemo(),'lists/list_tile_demo.dart'),
      buildSubtitle('ListView.builder()', ListviewBuilderDemo(),'lists/listview_builder_demo.dart'),
      buildSubtitle('Gridview', GridviewBuilderDemo(), 'lists/gridview_builder_demo.dart'),
      buildSubtitle('Swipe To Dismiss', SwipeToDismissDemo(),'lists/swipe_to_dismiss_demo.dart'),
      buildSubtitle('ReorderableListView', ReorderableListviewDemo(),'lists/reorderable_listview_demo.dart' ),
      buildSubtitle('SlidableListTile', SlidableListtileDemo(),'lists/slidable_listtile_demo.dart'),
      buildSubtitle('Data Table', DatatableDemo(),'lists/datatable_demo.dart'),
    ];

    final List<Widget> appbars = [
      buildSubtitle('BottomAppBar', BottomAppbarDemo(),'appbars/bottom_appbar_demo.dart'),
      buildSubtitle('Sliver AppBar', SliverAppbarDemo(),'appbars/sliver_appbar_demo.dart'),
      buildSubtitle('Backdrop', BackdropDemo(),'appbars/backdrop_demo.dart'),
      buildSubtitle('Convex Bottom Bar', ConvexBottomBarDemo(),'appbars/convex_bottom_bar_demo.dart'),
      buildSubtitle('HidableBottomNavBar', HidableBottomAppbarDemo(),'appbar/hidable_bottom_appbar_demo.dart'),
      buildSubtitle('SearchBar', SearchbarDemo(),'appbar/searchbar_demo.dart'),
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

    final List<Widget> async = [
      buildSubtitle('FutureBuilder', Placeholder(), ''),
      buildSubtitle('StreamBuilder', Placeholder(), ''),
    ];

    final List<Widget> animations = [
      buildSubtitle('Hero', Placeholder(), ''),
      buildSubtitle('Opacity', Placeholder(), ''),
      buildSubtitle('AnimatedContainer', Placeholder(), ''),
      buildSubtitle('AnimationPackage', Placeholder(), ''),
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
                buildTitle('Async', async),
                buildTitle('Animation', animations),
              ],
            ),
          ),
        ));
  }
}
