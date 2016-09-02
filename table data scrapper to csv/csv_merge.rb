require 'CSV'
hs = %w{ access_hash created_at unit }

CSV.open('ipsa_result.csv','w') do |csv|
  csv << hs
  page = 6
	while page > 0  do
		dir = "/Users/cloudfactory/Downloads/data (#{page}).csv";
	   CSV.foreach(dir, headers: true) {|row| csv << row.values_at(*hs) }
	   page = page - 1
	end
  # CSV.foreach('/Users/cloudfactory/Downloads/data.csv', headers: true) {|row| csv << row.values_at(*hs) }
  CSV.foreach('/Users/cloudfactory/Downloads/data.csv', headers: true) do |row|
    csv << row
  end
end
