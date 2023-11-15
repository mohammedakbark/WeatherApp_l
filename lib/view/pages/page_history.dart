import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/colors.dart';
import 'package:weather_app/viewmodel/provider/provide_historydata.dart';
import 'package:weather_app/viewmodel/provider/provider_theme.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    final sHProvider = Provider.of<SearchHistoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Consumer<ThemeProvider>(builder: (context, themestate, child) {
          return Text(
            "History",
            style: TextStyle(
                color:
                    themestate.getDarktheme ? defaultWhiteColor : defaultAmber),
          );
        }),
      ),
      body: FutureBuilder(
          future: sHProvider.getSearchHistory(),
          builder: (context, snapshot) {
            if (sHProvider.searchListData.isEmpty) {
              return const Center(child: Text('No search history'));
            }
            return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: sHProvider.searchListData.length,
                    itemBuilder: (context, index) {
                      final reversedIndex =
                          sHProvider.searchListData.length - 1 - index;

                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 197, 196, 192),
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        width: double.infinity,
                        child: ListTile(
                          leading: Text(sHProvider.date[reversedIndex]),
                          title: Text(
                              sHProvider.searchListData[reversedIndex]),
                          trailing: Text(sHProvider.time[reversedIndex]),
                        ),
                      );
                    }));
          }),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height / 12,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              Provider.of<SearchHistoryProvider>(context, listen: false)
                  .clearSearchHistory();
            },
            child: const Text("Clear History",
                style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
