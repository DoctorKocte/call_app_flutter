import 'package:call_app/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({required this.tabsTitles, required this.onTap, super.key});

  final List<String> tabsTitles;
  final Function(int) onTap;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: widget.tabsTitles.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return Container(
      height: 56,
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.background.lightGray,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        onTap: (tabIndex) {
          setState(() {
            widget.onTap(tabIndex);
          });
        },
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(6),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.background.white),
        labelColor: colorScheme.textColor.black,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        unselectedLabelColor: colorScheme.textColor.secondary,
        tabs: widget.tabsTitles.map((title) =>   
         Tab(
        child: Text(title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                height: 1,
                fontFamily: FontFamily.graphik,
                fontWeight: FontWeight.w600,
                fontSize: 13)))
          ).toList()
      ),
    );
  }
}