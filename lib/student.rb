class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    # @name = student_hash[:name]
    # @location = student_hash[:location]
    # @twitter = student_hash[:twitter] if :twitter
    # @linkedin = student_hash[:linkedin] if :linkedin
    # @github = student_hash[:github] if :github
    # @blog = student_hash[:blog] if :blog
    # @profile_quote = student_hash[:profile_quote] if :profile_quote
    # @bio = student_hash[:bio] if :bio
    # @profile_url = student_hash[:profile_url] if :profile_url


    #using send method 
    #https://www.youtube.com/watch?v=cY-wxg5z5bA&ab_channel=CJAvilla

    student_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    self.class.all << self
  end

  def self.create_from_collection(students_array)
    students_array.map {|student|new_student = Student.new(student)}
  end


  #study up on send method. Iterates over the hash and dynamyically assign the student attributes and values per key and valu
  def add_student_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end

  def self.all
    @@all
  end
end

