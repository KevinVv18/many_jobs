class ManyJobs::Job
  attr_accessor :name, :company, :location, :salary, :url

  

  def self.fulltimejob

    link= Nokogiri::HTML(Kernel.open("https://www.ziprecruiter.com/n/Full-Time-Jobs-Near-Me?radius=1000"))


    full_time= link.css('div.job_content')

    full_time.collect do |job_list|
      job = self.new
      job.name= job_list.css('h2').text.strip
      job.company= job_list.css('p').children[1].text.strip
      job.location= job_list.css('span.t_location_link').text.strip
      job.url= link.css('div.job_result_item')[0].attributes["data-job-tap-url"].text.strip
      job
    end

  end

  def self.parttimejob

    link= Nokogiri::HTML(Kernel.open("https://www.ziprecruiter.com/n/Part-Time-Jobs-Near-Me?radius=1000"))


    part_time= link.css('div.job_content')

    part_time.collect do |job_list|
      job = self.new
      job.name= job_list.css('h2').text.strip
      job.company= job_list.css('p').children[1].text.strip
      job.location= job_list.css('span.t_location_link').text.strip
      job.url= link.css('div.job_result_item')[0].attributes["data-job-tap-url"].text.strip
      job
    end

  end

end
