class ManyJobs::CLI

  def start

    puts "Welcome to ManyJobs!"
    menu
    link_to_applied

  end

  def menu
    puts "Are you looking for:"
    puts " "
    puts "1. Full Time"
    puts "2. Part Time"
    puts "3. Exit"
    input = gets.strip.downcase
    case input
    when "1"
      puts "Select one to applied!:"
      list_fulltime
    when "2"
      puts "Select one to applied!:"
      list_parttime
    when "3"
      puts "Are you sure you want to leave?"
    else
      puts "Enter a valid input"
      menu
    end

  end

  def list_fulltime
    ManyJobs::Scraper.scraper_full_time
    @jobs = ManyJobs::Job.all_full_time
     @jobs.each.with_index(1) do |job, i|

       puts "#{i}. #{job.name} - #{job.company} - #{job.location}"
     end
      #link_to_applied
  end

  def list_parttime
    ManyJobs::Scraper.scraper_part_time
    @jobs = ManyJobs::Job.all_part_time
     @jobs.each.with_index(1) do |job, i|

       puts "#{i}. #{job.name} - #{job.company} - #{job.location}"
     end
      #link_to_applied
  end

  def link_to_applied

    input = nil
    while input != "exit"
      puts "Type 'back' to go back or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i < 21 && input.to_i > 0
        the_job = @jobs[input.to_i-1]
        puts "#{the_job.name} - #{the_job.url}"
      elsif input.downcase == "back"
        menu
      elsif input.downcase == "exit"
        adios
      else
        puts "Invalid input."
      end
    end
  end

    def adios
      puts "See you later for new jobs!"
    end
end
