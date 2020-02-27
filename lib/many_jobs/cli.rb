class ManyJobs::CLI

  def start

    puts "Welcome to ManyJobs!"
    part_fulltime
    link_to_applied

  end

  def part_fulltime
    puts "Are you looking for:"
    puts " "
    puts "1. Full Time"
    puts "2. Part Time"
    puts "3. Exit"
    input = gets.strip
    case input
    when "1"
      puts "Select one to applied!:"
      full_time_job
    when "2"
      puts "Select one to applied!:"
      part_time_job
    when "3"
      puts "Are you sure you want to leave?"
    else
      puts "Enter a valid input"
    end
  end

  def full_time_job
    @jobs = ManyJobs::Job.fulltimejob
     @jobs.each.with_index(1) do |job, i|

       puts "#{i}. #{job.name} - #{job.company} - #{job.location} - #{job.salary}"
     end

  end

  def part_time_job
    @jobs = ManyJobs::Job.parttimejob
     @jobs.each.with_index(1) do |job, i|

       puts "#{i}. #{job.name} - #{job.company} - #{job.location}"
     end
  end

  def link_to_applied

    input = nil
    while input != "exit"
      puts "Type 'back' to go back or 'exit' to leave."
      input = gets.strip

      if input.to_i > 0
        the_job = @jobs[input.to_i-1]
        puts "#{the_job.name} - #{the_job.url}"
      elsif input == "back"
        part_fulltime
      elsif input == "exit"
        adios
      else
        puts "Invalid input type 'back' or 'exit'."
      end
    end
  end

    def adios
      puts "See you later for new jobs!"
    end
end
