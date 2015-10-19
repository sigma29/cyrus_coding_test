class Person
  def initialize(data = {})
    @last_name = data[:last_name]
    @first_name = data[:first_name]
    @sex = data[:sex]
    @birthday = data[:birthday]
    @favorite_color = data[:favorite_color]
  end

  def print
    puts "#{@last_name} #{@first_name} #{@sex} #{@birthday} #{@favorite_color}"
  end
end
