import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({required this.onTap, super.key});

  final Function(int) onTap;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabs.length);
    super.initState();
  }

  Widget _tabItem(String label, {bool isSelected = false}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: AnimatedContainer(
            width: double.infinity,
            duration: const Duration(milliseconds: 500),
            decoration: !isSelected
                ? null
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
            child: Center(
              child: Text(label, style: TextStyle(fontSize: 13)),
            )));
  }

  final _tabs = [Tab(text: 'Email'), Tab(text: 'Phone number')];

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
            _selectedIndex = tabIndex;
            widget.onTap(tabIndex);
          });
        },
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(6),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorScheme.background.white),
        labelColor: colorScheme.textColor.black,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        unselectedLabelColor: colorScheme.textColor.secondary,
        tabs: _tabs,
      ),
    );
  }
}
