import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/modals/modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  String search = "";
  String initUrl =
      "https://www.google.co.in/search?q=flutter&sxsrf=APwXEdeAazV-uaErFytNNOWwF-E01GcPbA%3A1688041549444&source=hp&ei=TXidZMKbGLeA2roPloOukAc&iflsig=AOEireoAAAAAZJ2GXStIOPxcoKcIhb-G7bM5ttTgAu9D&ved=0ahUKEwiC9qvnvOj_AhU3gFYBHZaBC3IQ4dUDCAk&uact=5&oq=flutter&gs_lcp=Cgdnd3Mtd2l6EAMyBwgjEIoFECcyCwgAEIAEELEDEIMBMggIABCABBCxAzIICAAQgAQQsQMyCwgAEIoFELEDEIMBMggIABCABBCxAzILCAAQgAQQsQMQgwEyCwguEIoFELEDEIMBMgsIABCABBCxAxCDATIICAAQgAQQsQM6BAgjECc6EQguEIAEELEDEIMBEMcBENEDOg4ILhCDARDUAhCxAxCABDoLCC4QgAQQsQMQgwE6BQgAEIAEUABYoQ5g9xZoAHAAeACAAbkBiAGwCZIBAzAuN5gBAKABAQ&sclient=gws-wiz";

  List<AllUrl> list = [
    AllUrl(
      name: "Google",
      url: "https://www.google.co.in/",
    ),
    AllUrl(
      name: "Yahoo",
      url: "https://www.yahoo.com/",
    ),
    AllUrl(
      name: "DuckDuckGo",
      url: "https://duckduckgo.com/",
    ),
    AllUrl(
      name: "Bing",
      url: "https://www.bing.com/#!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Browser",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          PopupMenuButton(
              // onSelected: (val) {
              //   setState(() {
              //     initUrl = val as String;
              //   });
              // },
              child: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (context) {
                return list.map((e) {
                  return PopupMenuItem(
                    onTap: () {
                      setState(() {
                        initUrl = e.url!;
                      });
                      debugPrint(initUrl);
                    },
                    value: e,
                    child: Text(e.name),
                  );
                }).toList();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: InAppWebView(
                pullToRefreshController: refreshController,
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    initUrl,
                  ),
                ),
                onWebViewCreated: (controller) {
                  setState(() {
                    webViewController = controller;
                  });
                },
                onLoadStart: (controller, url) {},
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "search",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                onSaved: (val) {
                  setState(() {
                    search = val!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
