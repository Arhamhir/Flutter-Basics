import 'package:flutter/material.dart';
import 'package:test_proj/models/app_details.dart';
import 'package:test_proj/models/category_model.dart';
import 'package:test_proj/models/popular_apps.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  List<CategoryModel> categories = [];
  List<AppDetails> appDetails = [];
  List<PopularApps> popularApps = [];

  void _getAppDetails() {
    appDetails = AppDetails.getDetails();
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getPopularApps() {
    popularApps = PopularApps.getPopularApps();
  }

  @override
  Widget build(BuildContext context) {
    _getAppDetails();
    _getCategories();
    _getPopularApps();
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView( // FIX: allow page to scroll to avoid overflow
        child: Column(
          children: [
            _searchField(),
            SizedBox(height: 40),
            _myCategories(),
            SizedBox(height: 40),
            _categoriesInfo(),
            SizedBox(height: 40),
            _popularApps(context),
          ],
        ),
      ),
    );
  }

  Column _popularApps(BuildContext context) {
    return Column(
      children: [
        Text(
          'Popular Apps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 120,
          child: ScrollConfiguration( 
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20), 
              itemCount: popularApps.length,
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => SizedBox(height: 16), 
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 50,
                        height: 72,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: popularApps[index].icon,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularApps[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              popularApps[index].popularityReason,
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Column _categoriesInfo() {
    return Column(
      children: [
        Text(
          'App Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 280,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20), // FIX: add side padding so cards do not touch the edges
            itemCount: appDetails.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(), // FIX: restore stretch/bounce feel on horizontal scroll
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                decoration: BoxDecoration(
                  color: appDetails[index].backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: appDetails[index].icon,
                    ),
                    SizedBox(height: 10),
                    Text(
                      appDetails[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Version: ${appDetails[index].version}',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 110),
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Developer: ${appDetails[index].developer}',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 110),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        appDetails[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(221, 255, 255, 255),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            color: appDetails[index].isSelected
                                ? const Color.fromARGB(255, 255, 5, 5)
                                : const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _myCategories() {
    return Column(
      children: [
        Text(
          'Apps',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 120,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20), // FIX: add side padding so cards do not touch the edges
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(), // FIX: restore stretch/bounce feel on horizontal scroll
            separatorBuilder: (context, index) => SizedBox(width: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[index].backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: categories[index].icon,
                    ),
                    SizedBox(height: 10),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 40, right: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 190, 76, 210),
      title: Text(
        'Meow App',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          child: Icon(Icons.arrow_back),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
