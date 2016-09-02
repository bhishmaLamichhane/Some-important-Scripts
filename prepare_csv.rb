require 'CSV'
require 'json'
require 'pry'
csv_all = []
final_result = []
i = 0
CSV.foreach('/Users/cloudfactory/Documents/field_id_6577092.csv') do |row|
    csv_all << row
end
csv_all.shift
hash = {}
csv_all.each  do |data|
  hash['id'] = i
  hash['image'] = data[0]
  final_result << hash
  i += 1
end
count =0
CSV.open("basu.csv", "wb", :write_headers=> true, :headers => ["id","input"]) do |csv|

  final_result.each do |hash|
    csv << hash
    p count
    count += 1
  end
end