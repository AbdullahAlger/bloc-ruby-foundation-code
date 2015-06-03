def greeting

	ARGV[1..-1].each do |arg|
		puts "#{ARGV[0]}, #{arg}!"
	end

end
greeting
