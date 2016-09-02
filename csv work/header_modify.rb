require 'CSV'
csv_all = []
CSV.foreach('/Users/cloudfactory/Documents/Super 13th.csv') do |row|
    csv_all << row
end
header = csv_all.shift
header_final = []
header.each  do |data|
  header_final << data.split('.').last
end


CSV.open("tsting.csv", "wb", :write_headers=> true, :headers => header_final) do |csv|

  csv_all.each do |data|
    csv << data
  end
end