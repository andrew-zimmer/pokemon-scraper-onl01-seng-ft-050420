class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  @@all = []
  
  def initialize(name:, type:, db:, id:nil)
    @name = name 
    @type = type 
    @id = id 
    @db = db
    @@all << self
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.save(name, type, db)
    pk = self.all.find{|obj| obj.name == name}
    sql = <<-SQL 
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    db.execute(sql, pk.name, pk.type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
  
  end 
  
  def update
    sql = <<-SQL
      UPDATE pokemon SET name = ?, type = ?
      WHERE id = ? 
    SQL
    @db.execute(sql, self.name, self.type, self.id)
  end 
  
end 
