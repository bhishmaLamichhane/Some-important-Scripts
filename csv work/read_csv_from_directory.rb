require 'CSV'
require 'json'
require 'pry'
all_file = Dir["*.csv"]
all_file.each do |file_name|
  # binding.pry
  csv_all = []
  final_result = []
  i = 0
  CSV.foreach(file_name) do |row|
      csv_all << row
  end
  csv_all.shift
  hash = {}
  puts csv_all.count
  csv_all.each do |data|
    hash = {}
    hash['id'] = i
    hash['image'] = data[0]
    final_result << hash
    i += 1
  end
  count =0
  final_result = final_result.to_json
  file = file_name.split('_')[2]
  CSV.open(file, "wb") do |csv|
    csv << ["tasks"]
    csv << [final_result]
  end
end