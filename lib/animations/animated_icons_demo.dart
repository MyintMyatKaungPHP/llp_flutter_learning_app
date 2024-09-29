import 'package:flutter/material.dart';

Map<String, AnimatedIconData> animatedIcons = {
  'add_event': AnimatedIcons.add_event,
  'arrow_menu': AnimatedIcons.arrow_menu,
  'close_menu': AnimatedIcons.close_menu,
  'ellipsis_search': AnimatedIcons.ellipsis_search,
  'event_add': AnimatedIcons.event_add,
  'home_menu': AnimatedIcons.home_menu,
  'list_view': AnimatedIcons.list_view,
  'menu_arrow': AnimatedIcons.menu_arrow,
  'menu_close': AnimatedIcons.menu_close,
  'menu_home': AnimatedIcons.menu_home,
  'pause_play': AnimatedIcons.pause_play,
  'play_pause': AnimatedIcons.play_pause,
  'search_ellipsis': AnimatedIcons.search_ellipsis,
  'view_list': AnimatedIcons.view_list,
};

class AnimatedIconsDemo extends StatelessWidget {
  const AnimatedIconsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for(final kv in animatedIcons.entries)
          AnimatedIconItem(name: kv.key, icon: kv.value)
      ],
    );
  }
}

class AnimatedIconItem extends StatefulWidget {
  const AnimatedIconItem({super.key, required this.name, required this.icon});
  final String name;
  final AnimatedIconData icon;

  @override
  State<AnimatedIconItem> createState() => _AnimatedIconItemState();
}

class _AnimatedIconItemState extends State<AnimatedIconItem> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: (){
            animationController.isCompleted ? animationController.reverse() : animationController.forward();
          },
          child: AnimatedIcon(
              icon: widget.icon,
              progress: animationController,
              size: 128,
          ),
        ),
        Text(widget.name)
      ],
    );
  }
}

