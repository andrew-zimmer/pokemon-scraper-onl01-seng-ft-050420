class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db 
  
  def initialize(name:, type:, id:nil, db:)
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
      
end
