class ReelsModel {
  List<DataModel>? data;
  Links? links;
  Meta? meta;
  String? status;
  Null message;

  ReelsModel({this.data, this.links, this.meta, this.status, this.message});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(DataModel.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class DataModel {
  int? id;
  bool? isMine;
  int? roomId;
  String? video;
  String? preview;
  String? size;
  String? duration;
  int? likesCount;
  String? likesCountTranslated;
  bool? authLikeStatus;

  DataModel(
      {this.id,
        this.isMine,
        this.roomId,
        this.video,
        this.preview,
        this.size,
        this.duration,
        this.likesCount,
        this.likesCountTranslated,
        this.authLikeStatus});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isMine = json['is_mine'];
    roomId = json['room_id'];
    video = json['video'];
    preview = json['preview'];
    size = json['size'];
    duration = json['duration'];
    likesCount = json['likes_count'];
    likesCountTranslated = json['likes_count_translated'];
    authLikeStatus = json['auth_like_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_mine'] = isMine;
    data['room_id'] = roomId;
    data['video'] = video;
    data['preview'] = preview;
    data['size'] = size;
    data['duration'] = duration;
    data['likes_count'] = likesCount;
    data['likes_count_translated'] = likesCountTranslated;
    data['auth_like_status'] = authLikeStatus;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  Null prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
        this.from,
        this.lastPage,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
