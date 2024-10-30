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
              Image.network(
                'https://image.tmdb.org/t/p/w500${dataModel.posterPath}',
                width: AppValues.height_100,
                height: AppValues.width_150,
                fit: BoxFit.cover,
              ),
              SizedBox(width: AppValues.width_16),
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
                        fontSize: AppValues.font_16,
                      ),
                    ),
                    SizedBox(height: AppValues.padding),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: AppValues.margin_12,
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