class Tables {
  static String noteTableName = 'notes';

  static String noteTable = '''
    CREATE TABLE IF NOT EXISTS $noteTableName(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     title TEXT,
     content TEXT,
     createdAt TEXT,
     lastModified TEXT
    )''';
}
