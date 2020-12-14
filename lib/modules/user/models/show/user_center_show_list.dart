import 'package:newslash/modules/user/models/show/user_center_show_item.dart';

enum UserCenterListShowListKey {
  settings,
  about,
}

class UserCenterListShowList {
  late List<UserCenterShowItem> items;
  UserCenterListShowList() {
    this.items = <UserCenterShowItem>[];
    this.items.add(UserCenterShowItem(key: UserCenterListShowListKey.settings, title: '设置'));
    this.items.add(UserCenterShowItem(key: '', title: '设置'));
    this.items.add(UserCenterShowItem(key: '', title: '设置'));
    this.items.add(UserCenterShowItem(key: '', title: '设置'));
    this.items.add(UserCenterShowItem(key: '', title: '设置'));
    this.items.add(UserCenterShowItem(key: UserCenterListShowListKey.about, title: '关于'));
  }
}
