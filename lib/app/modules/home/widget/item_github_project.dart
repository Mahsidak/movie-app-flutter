import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/widget/ripple.dart';
import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:get/get.dart';

import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/modules/home/model/github_project_ui_data.dart';
import '/app/routes/app_pages.dart';

class ItemGithubProject extends StatelessWidget with BaseWidgetMixin {
  final Movie dataModel;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(

                radius: AppValues.circularImageSize_30,
              ),
              const SizedBox(width: AppValues.margin_10),
              _getDetailsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDetailsView() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dataModel.title ?? '',
            style: cardTitleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(height: AppValues.margin_4),
        ],
      ),
    );
  }

  void _onTap() {
    Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);
  }
}
