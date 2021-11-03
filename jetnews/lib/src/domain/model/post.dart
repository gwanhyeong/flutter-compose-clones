import 'dart:core';

class Post {
  String id;
  String title;
  String? subtitle;
  String url;
  Publication? publication;
  Metadata metadata;
  List<Paragraph> paragraphs;

  Post(this.id, this.title, this.subtitle, this.url, this.publication,
      this.metadata,
      [this.paragraphs = const <Paragraph>[]]);
}

class Metadata {
  PostAuthor author;
  String date;
  int readTimeMinutes;

  Metadata(this.author, this.date, this.readTimeMinutes);
}

class PostAuthor {
  String name;
  String? url;

  PostAuthor(this.name, this.url);
}

class Publication {
  String name;
  String logoUrl;

  Publication(this.name, this.logoUrl);
}

class Paragraph {
  ParagraphType type;
  String text;
  List<Markup> markups;

  Paragraph(this.type, this.text, [this.markups = const <Markup>[]]);
}

class Markup {
  MarkupType type;
  int start;
  int end;
  String? href;

  Markup(this.type, this.start, this.end, [this.href]);
}

enum MarkupType {
  link,
  code,
  italic,
  bold,
}

enum ParagraphType {
  title,
  caption,
  header,
  subhead,
  text,
  codeBlock,
  quote,
  bullet,
}
