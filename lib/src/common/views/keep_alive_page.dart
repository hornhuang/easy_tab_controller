import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  Widget child;

  KeepAlivePage({Key? key, required this.child}) : super(key: key);

  @override
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> with AutomaticKeepAliveClientMixin {

//  KeepAliveHandle _keepAliveHandle;
//
//  void _ensureKeepAlive() {
//    assert(_keepAliveHandle == null);
//    _keepAliveHandle = KeepAliveHandle();
//    KeepAliveNotification(_keepAliveHandle).dispatch(context);
//  }

  @override
  bool get wantKeepAlive => true;

//  @protected
//  void updateKeepAlive() {
//    if (wantKeepAlive) {
//      if (_keepAliveHandle == null)
//        _ensureKeepAlive();
//    } else {
//      if (_keepAliveHandle != null)
//        _releaseKeepAlive();
//    }
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    if (wantKeepAlive)
//      _ensureKeepAlive();
//  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
