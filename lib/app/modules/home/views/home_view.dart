import 'package:flutter/material.dart';
import '../../../data/model/movie_list_response.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/viewModel/home_view_model.dart';
import '/app/modules/home/widget/item_github_project.dart';

class HomeView extends StatelessWidget {
  HomeViewModel viewModel = HomeViewModel();

  HomeView() {
    viewModel.getMovieList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'Movies',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        viewModel.onRefreshPage();
      },
      onLoadNextPage: () {
        viewModel.onLoadNextPage();
      },
      child: ValueListenableBuilder<List<MovieData>>(
        valueListenable: viewModel.movieList,
        builder: (context, movieList, _) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: movieList.length,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = movieList[index];

              return MovieCard(dataModel: model);
            },
            separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: AppValues.margin_zero),
          );
        },
      ),
    );
  }

}