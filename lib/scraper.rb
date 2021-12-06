require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = URI.open(index_url) #returns the html content of the page 
    doc = Nokogiri::HTML(html)
    
    students = []

    #iterate through the students 
    doc.css(".student-card").each do |student| 
      student_hash = {}

      student_hash[:name] =  student.css("h4.student-name").text
      student_hash[:location] =  student.css(".student-location").text
      student_hash[:profile_url] = student.css("a").attribute("href").value
      students << student_hash
    end
   
    students

  end


  def self.scrape_profile_page(profile_url)
    html = URI.open(profile_url) #returns the html content of the page 
    doc = Nokogiri::HTML(html)

    students = {}


    profile = doc.css(".vitals-container")

    links = profile.css(".social-icon-container").css("a").map { |el| el.attribute('href').value}
    
    links.each do |link| 
      if link.include?("twitter")
        students[:twitter] = link
      elsif link.include?("linkedin")
        students[:linkedin] = link
      elsif link.include?("github")
        students[:github] = link
      elsif  link.include?("blog")
        students[:blog] = link
      end 
    end

   
    profile_quote = profile.css(".profile-quote").text
    students[:profile_quote] = profile_quote 
    bio = doc.css(".bio-content").css(".description-holder").text.strip
    students[:bio] = bio

  
    students 

  end
end







