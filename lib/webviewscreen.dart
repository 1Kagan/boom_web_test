// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';

class WebviewScreen extends StatefulWidget {
  static const routeName = '/webview';
  final Stream shouldTriggerChange;

  WebviewScreen({required this.shouldTriggerChange});

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen>
    with WidgetsBindingObserver {
  num position = 1;
  num getOttLength = 0;
  bool pdfUrl = false;
  StreamSubscription<String>? _onUrlChanged;
  StreamSubscription<WebViewHttpError>? _onHttpError;
  StreamSubscription<String>? _onTargetChanged;
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged>? _onStateChanged;
  final key = UniqueKey();
  // final LocalStorage storage = LocalStorage('cat724');
  StreamSubscription? webviewStreamSubscription;
  StreamSubscription? silentNotificationListener;
  Map<String, dynamic>? downloadEventData;
  Map<String, dynamic>? soundEventData;
  String quotationNumber = '';
  bool cancelDownload = false;
  bool isLdapLogin = false;
  // bool _appBarVisible = false;
  bool appBarStatus = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: WebviewScaffold(
          allowFileURLs: true,
          resizeToAvoidBottomInset: true,
          key: key,
          ignoreSSLErrors: true,
          url: 'https://ps.uci.edu/~franklin/doc/file_upload.html',
          withLocalStorage: true,
          withJavascript: true,
          debuggingEnabled: true,
          hidden: true,
          // javascriptChannels: Set.from([
          //   JavascriptChannel(
          //     name: 'Borusan',
          //     onMessageReceived: _onJSMsgRecv,
          //   ),
          // ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _onUrlChanged?.cancel();
    _onHttpError?.cancel();
    _onTargetChanged?.cancel();
    _onStateChanged?.cancel();
    flutterWebviewPlugin.dispose();

    super.dispose();
  }
}
