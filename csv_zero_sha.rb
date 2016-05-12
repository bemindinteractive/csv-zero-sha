#!/usr/bin/env ruby

require 'digest'
require 'csv'

if ARGV.length == 0
	puts "File name:"
	ARGV[0] = gets.strip
end

ARGV.each do|a|
	puts "Parsing file: #{a}"

	f = File.new("./" + (a.sub ".csv", "") + "_encoded.csv", "w+")

	CSV.foreach("./" + a) do |row|
	  # use row here...
	  f.puts Digest::SHA256.hexdigest row[0].to_s.downcase
	end

end
