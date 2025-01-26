class FilterModel {
  FilterModel({
    required this.dataFilter,
  });
  late final List<DataFilter> dataFilter;

  FilterModel.fromJson(Map<String, dynamic> json){
    dataFilter = List.from(json['data']).map((e)=>DataFilter.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = dataFilter.map((e)=>e.toJson()).toList();
    return _data;
  }

}

class DataFilter {
  DataFilter({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  DataFilter.fromJson(Map<String, dynamic> json){
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


