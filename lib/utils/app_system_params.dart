import 'package:newslash/utils/enum_util.dart';

class AppSystemParams {
  var appSystemParams = {
    AppSystemParamsKeys.slashSource: SlashSource.Pexels,
    AppSystemParamsKeys.slashSourceSite: 'https://pixabay.com',
    AppSystemParamsKeys.version: null,
    AppSystemParamsKeys.contact: null,
    AppSystemParamsKeys.author: null,
  };

  static AppSystemParams instance;

  static AppSystemParams init() {
    if (instance == null) instance = AppSystemParams();
    return instance;
  }

  //TODO；加载配置数据，从数据库读取
  loadParamsFromDb() {}
  //TODO；更新配置数据，保存到数据库
  updateParamsToDb() {}
  //获取参数
  getParams(AppSystemParamsKeys key) {
    if (key is AppSystemParamsKeys)
      return appSystemParams[key];
    else
      return null;
  }

  //更新参数
  updateParams(AppSystemParamsKeys key, value) {
    if (key is AppSystemParamsKeys) appSystemParams[key] = value;
  }
}
