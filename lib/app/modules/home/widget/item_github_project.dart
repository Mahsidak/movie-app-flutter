import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/core/values/app_values.dart';
import 'package:flutter_getx_template/app/data/model/movie_list_response.dart';
import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

class MovieCard extends StatelessWidget {
  final MovieData dataModel;

  MovieCard({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  void _onTap() {
    Get.toNamed(Routes.PROJECT_DETAILS, arguments: dataModel);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        color: Colors.grey[900],
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.margin_10),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${dataModel.posterPath}',
                  height: AppValues.height_150,
                  width: AppValues.width_100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: AppValues.padding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataModel.title ?? dataModel.name ?? '',
                          style: TextStyle(
                            fontSize: AppValues.font_16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: AppValues.padding),
                        Text(
                          dataModel.description ?? 'No description available.',
                          style: TextStyle(
                            fontSize: AppValues.font_14,
                            color: Colors.grey[300],
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: AppValues.padding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Year: ${dataModel.releaseDate ?? ''}",
                          style: TextStyle(fontSize: AppValues.font_14, color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: AppValues.font_14),
                            SizedBox(width: 4),
                            Text(
                              "${dataModel.voteAverage}",
                              style: TextStyle(fontSize: AppValues.font_14, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
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
}