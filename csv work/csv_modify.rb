require 'CSV'
hs = %w{created_at total_unit }
csv_all = []
final_result = []
i = 0
CSV.foreach('/Users/.../Downloads/ipsa_result.csv') do |row|
    csv_all << row
end
csv_all.shift
date=[]
csv_all.each  do |data|
  date << data[1].split(' ').first
end
date = date.uniq
date.each do |d|
	final = {}
	final['created_at'] = d
	sum = 0
	csv_all.each  do |unit|
  	if d == unit[1].split(' ').first
  		sum += unit[2].to_i
  	end
	end
	final['total_unit'] = sum
	final_result << final
end

CSV.open("ffff.csv", "wb", :write_headers=> true, :headers => ["created_at","total_count"]) do |csv|

  final_result.each do |hash|
    csv << hash.values
  end
end