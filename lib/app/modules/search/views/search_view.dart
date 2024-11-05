import 'package:flutter/material.dart';
import '../../home/widget/item_github_project.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/modules/bookmarks/controllers/bookmarks_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/data/model/movie_list_response.dart';

class SearchView extends BaseView<BookmarksController> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieData> _searchResults = [];

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Search',
    );
  }

  void _onSearch(String query) {
    // Implement your search logic here
    // For example, you might call a method in your controller to fetch movies based on the query
    // setState(() { _searchResults = fetchedMovies; }); // Update the results
    print("object");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: _onSearch, // Trigger search on text change
            decoration: InputDecoration(
              hintText: 'Search for movies...',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[800],
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, index) {
              final model = _searchResults[index];

              return MovieCard(dataModel: model);
            },
          ),
        ),
      ],
    );
  }
}