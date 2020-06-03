class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, db:, id:nil)
    @name = name 
    @type = type 
    @id = id 
    @db = db
  end 
  
  def self.save
    
    
  end
  
  def update
    sql = <<-SQL
      UPDATE pokemon SET name = ?, type = ?
      WHERE id = ? 
    SQL
    @db.execute(sql, self.name, self.type, self.id)
  end 
  
end 
