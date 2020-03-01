class ManyJobs::Scraper

  attr_accessor :name, :company, :location, :url

  def self.scraper_full_time
    ManyJobs::Job.all_full_time.clear
  link= Nokogiri::HTML(Kernel.open("https://www.ziprecruiter.com/n/Full-Time-Jobs-Near-Me?radius=1000"))

  full_time= link.css('div.job_content')

  full_time.collect do |job_list|
    job = self.new
    job.name= job_list.css('h2').text.strip
    job.company= job_list.css('p').children[1].text.strip
    job.location= job_list.css('span.t_location_link').text.strip
    job.url= link.css('div.job_result_item')[0].attributes["data-job-tap-url"].text.strip
    ManyJobs::Job.all_full_time << job
    job
    end

  end

  def self.scraper_part_time
    ManyJobs::Job.all_part_time.clear
  link= Nokogiri::HTML(Kernel.open("https://www.ziprecruiter.com/n/Part-Time-Jobs-Near-Me?radius=1000"))

  part_time= link.css('div.job_content')

  part_time.collect do |job_list|
    job = self.new
    job.name= job_list.css('h2').text.strip
    job.company= job_list.css('p').children[1].text.strip
    job.location= job_list.css('span.t_location_link').text.strip
    job.url= link.css('div.job_result_item')[0].attributes["data-job-tap-url"].text.strip
    ManyJobs::Job.all_part_time << job
    job
    end
  end
end
