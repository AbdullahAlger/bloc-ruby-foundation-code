def greeting
	ARGV.each do |arg|
	puts "#{arg.first}"
	end
end
greeting
