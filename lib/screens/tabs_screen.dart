import 'package:flutter/material.dart';
import 'package:news_task/network/remot/api_manger.dart';
import 'package:news_task/screens/widgets/new_item.dart';
import 'package:news_task/screens/widgets/source_item.dart';

import '../models/newsResponse.dart';
import '../models/sourcesResponce.dart';

class TabsScreen extends StatefulWidget {
  //static const String routName = "Tabs";
  List<Sources> sourses;

  TabsScreen(this.sourses);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectItem = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourses.length,
          child: TabBar(
            onTap: (value) {
              selectItem = value;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: widget.sourses.map((source) {
              return SourceItem(
                  source, widget.sourses.indexOf(source) == selectItem);
            }).toList(),
          ),
        ),
        FutureBuilder(
          future: ApiManger.getNews(sourseId: widget.sourses[selectItem].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Sorry something Wrong"),
                  TextButton(onPressed: () {}, child: Text("TRY again"))
                ],
              );
            }
            if (snapshot.data?.status != "ok") {
              return Column(
                children: [
                  Text("Sorry something Wrong"),
                  TextButton(onPressed: () {}, child: Text("TRY again"))
                ],
              );
            }
            List<Articles> artical = snapshot.data?.articles ?? [];
            return Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return
                    // Text(artical[index]?.title??"");
                    NewsItem(artical[index]);
              },
              itemCount: artical.length,
            ));
          },
        )
      ],
    );
  }
}
