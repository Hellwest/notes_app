class Note {
  String id;
  String body;

  static const String DEFAULT_NAME = 'New note';

  Note({ this.id, this.body = '' });

  String get noteTitle {
    int lineLength = this.body.indexOf("\n");

    String firstLine = lineLength > 0 ? this.body.substring(0, lineLength) : this.body;

    return this.body.isNotEmpty ? firstLine : Note.DEFAULT_NAME;
  }
  
  int get characters {
    return this.body.length;
  }

  int get words {
    if (this.body.length == 0) {
      return 0;
    }

    return this.body.split(' ').length;
  }
}
