
class NotifcationFilterModel {
  NotifcationFilterModel({
    required this.notifcationFilter,
  });
  late final List<NotifcationFilter> notifcationFilter;

  NotifcationFilterModel.fromJson(Map<String, dynamic> json){
    notifcationFilter = List.from(json['data']).map((e)=>NotifcationFilter.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = notifcationFilter.map((e)=>e.toJson()).toList();
    return _data;
  }

}

class NotifcationFilter {
  NotifcationFilter({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  NotifcationFilter.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}


