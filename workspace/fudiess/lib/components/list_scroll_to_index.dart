import 'package:flutter/material.dart';

class ListScrollToIndex extends StatefulWidget {
  final double itemWidth;

  /// item witdh
  final double itemHeight;

  /// item height
  final Axis? scrollDirection;

  /// scroll direction
  final IndexedWidgetBuilder itemBuilder;

  /// item buider
  final int itemCount;

  /// item count
  final bool? addAutomaticKeepAlives;

  /// keep alives list default false
  final Duration? duration;

  /// duration scroll
  final ScrollToIndexController? controller;

  /// ScrollToIndexController
  const ListScrollToIndex(
      {Key? key,
        this.addAutomaticKeepAlives,
        required this.itemWidth,
        required this.itemHeight,
        required this.itemCount,
        required this.itemBuilder,
        this.scrollDirection,
        this.duration,
        this.controller})
      : super(key: key);

  @override
  _ListScrollToIndexState createState() => _ListScrollToIndexState();
}

class _ListScrollToIndexState extends State<ListScrollToIndex> {
  final ScrollController _scrollController = ScrollController();

  listScrollToIndex({required int index}) {
    if (index > widget.itemCount) return;
    if (widget.scrollDirection == null) {
      _scrollController.animateTo(index * widget.itemHeight.toDouble(),
          duration: widget.duration ?? const Duration(milliseconds: 1000),
          curve: Curves.linear);
    } else if (widget.scrollDirection == Axis.horizontal) {
      _scrollController.animateTo(index * widget.itemWidth.toDouble(),
          duration: widget.duration ?? const Duration(milliseconds: 1000),
          curve: Curves.linear);
    } else {
      _scrollController.animateTo(index * widget.itemHeight.toDouble(),
          duration: widget.duration ?? const Duration(milliseconds: 1000),
          curve: Curves.linear);
    }
  }

  @override
  void initState() {
    super.initState();
    setController();
  }

  @override
  void didUpdateWidget(covariant ListScrollToIndex oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      setController();
    }
  }

  void setController() {
    widget.controller?.setState(this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: widget.scrollDirection == Axis.vertical ||
              widget.scrollDirection == null
              ? MediaQuery.of(context).size.height
              : widget.itemHeight,
          child: ListView.builder(
              addAutomaticKeepAlives: widget.addAutomaticKeepAlives ?? false,
              scrollDirection: widget.scrollDirection ?? Axis.vertical,
              controller: _scrollController,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder),
        ));
  }
}

class ScrollToIndexController {
  _ListScrollToIndexState? _scrollToIndexState;

  void listScrollToIndex({required int index}) {
    _scrollToIndexState!.listScrollToIndex(index: index);
  }

  void setState(_ListScrollToIndexState state) {
    _scrollToIndexState = state;
  }
}