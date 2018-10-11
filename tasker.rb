# Developing tool for tracking time casually.

# Setting defaults
dat = nil
total_time = total_valu = count = 0
sums = []
t1 = t0 = nil
rate = 1

puts "What's your hourly rate?"
rate = gets.chomp

puts "Type 'start' or 'stop' to clock in/out."

# Looping through
until (dat == "exit" || dat == "quit") || count == 30

    dat = gets.chomp
    count += 1

    if dat == "start"
        t0 = Time.now
        puts "#{dat} at #{t0}."
    elsif dat == "stop"
        t1 = Time.now
        puts "#{dat} at #{t1}."
    end

    if t1 && t0
        sums.push(t1-t0)
        t1 = t0 = nil
    end
end

# Summarizing
sums.each do |time|
    total_time += time/(60*60)
end
    total_valu = total_time * rate.to_i
    puts "Total time @ rate: #{total_time.round(2)} * #{rate}.....Total due: #{total_valu}"
exit
