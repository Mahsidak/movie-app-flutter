 import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import '/app/core/model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseController {
  final Logger logger = BuildConfig.instance.config.logger;


}
