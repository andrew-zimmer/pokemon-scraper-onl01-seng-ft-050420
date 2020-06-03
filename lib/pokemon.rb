class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, db:, id:nil)
    @name = name 
    @type = type 
    @id = id 
    @db = db
  end 
  
  def save
    if self.id 
      self.update
    else 
      sql = <<-SQL 
        INSERT INTO pokemon (
          name TEXT, 
          type TEXT);
        VALUES (?, ?)
      SQL
      @db.execute(sql, self.name, self.type)
      @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 
  end
  
  def update
    sql = <<-SQL
      UPDATE pokemon SET name = ?, type = ?
      WHERE id = ? 
    SQL
    @db.execute(sql, self.name, self.type, self.id)
  end 
  
end 
