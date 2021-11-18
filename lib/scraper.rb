require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = URI.open(index_url) #returns the html content of the page 
    doc = Nokogiri::HTML(html)


    #page: doc = Nokogiri::HTML(html)
    # student =  doc.css(".student-card")
    # name =  student.css(".student-name").text
    # location = student.css(".student-location").text
    # profile_url = doc.css(".student-card a").attribute("href").value

    students = {}

    #iterate through the students 
    doc.css(".student-card").each do |student|
      students[:name] =  student.css("h4.student-name").children.text,
      students[:location] =  student.css(".student-location").text,
      students[:profile_url] = doc.css(".student-card a").attribute("href").value
    end

    #return the student hash
    students
   
   binding.pry
  end

  def self.scrape_profile_page(profile_url)
    
  end

end






