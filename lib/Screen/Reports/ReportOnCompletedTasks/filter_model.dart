
class FilterModel {
  FilterModel({
    required this.filter,
  });
  late final List<Filter> filter;

  FilterModel.fromJson(Map<String, dynamic> json){
    filter = List.from(json['data']).map((e)=>Filter.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = filter.map((e)=>e.toJson()).toList();
    return _data;
  }

}

class Filter {
  Filter({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Filter.fromJson(Map<String, dynamic> json){
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


