import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/widget/ripple.dart';
import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:get/get.dart';

import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/routes/app_pages.dart';

class ItemGithubProject extends StatelessWidget with BaseWidgetMixin {
  final MovieData dataModel;

  ItemGithubProject({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Ripple(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster image from URL
              Image.network(
                'https://image.tmdb.org/t/p/w500${dataModel.posterPath}',
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 17),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataModel.title ?? dataModel.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() {
    Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);
  }
}
//https://image.tmdb.org/t/p/w500