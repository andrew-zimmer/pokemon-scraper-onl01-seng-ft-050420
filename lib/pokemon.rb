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
    
    
  end
  
  def update
    sql = <<-SQL
      UPDATE pokemon SET name = ?, type = ?
      WHERE id = ? 
    SQL
    @db.execute(sql, self.name, self.type, self.id)
  end 
  
end 
