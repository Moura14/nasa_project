class ApodModel {
  final String date;
  final int postId;
  final String title;
  final String permalink;
  final String mediaType;
  final String explanation;
  final String credit;
  final String copyright;
  final String alt;
  final String url;
  final String hdurl;
  final String basicHtml;

  ApodModel({
    required this.date,
    required this.postId,
    required this.title,
    required this.permalink,
    required this.mediaType,
    required this.explanation,
    required this.credit,
    required this.copyright,
    required this.alt,
    required this.url,
    required this.hdurl,
    required this.basicHtml,
  });

  
  factory ApodModel.fromJson(Map<String, dynamic> json) {
    return ApodModel(
      date: json['date'] ?? '',
      postId: json['post_id'] ?? 0,
      title: json['title'] ?? '',
      permalink: json['permalink'] ?? '',
      mediaType: json['media_type'] ?? '',
      explanation: json['explanation'] ?? '',
      credit: json['credit'] ?? '',
      copyright: json['copyright'] ?? '',
      alt: json['alt'] ?? '',
      url: json['url'] ?? '',
      hdurl: json['hdurl'] ?? '',
      basicHtml: json['basic_html'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'post_id': postId,
      'title': title,
      'permalink': permalink,
      'media_type': mediaType,
      'explanation': explanation,
      'credit': credit,
      'copyright': copyright,
      'alt': alt,
      'url': url,
      'hdurl': hdurl,
      'basic_html': basicHtml,
    };
  }
}
