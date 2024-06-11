import 'package:fast_app/config/app_colors.dart';
import 'package:fast_app/screens/search/recent_search_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final recentSearchesManager = RecentSearchesManager();
  List<String>? sList;
  @override
  void initState() {
    getRecent();
    super.initState();
  }

  getRecent() async {
    sList = await recentSearchesManager.getRecentSearches();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Find exactly what you need!",
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: backgroundColor,
              onSubmitted: (val) async {
                recentSearchesManager.addRecentSearch(val);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Recent Searches"),
            ),
            sList == null
                ? const Text("No recent searches")
                : Expanded(
                    child: ListView.builder(
                        itemCount: sList!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(sList![index]),
                                const Icon(Icons.arrow_outward_rounded)
                              ],
                            ),
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
