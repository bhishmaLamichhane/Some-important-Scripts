data_file = '/Users/cloudfactory/Desktop/aa.csv'
result = []
CSV.foreach(data_file, headers: true) do |row|
  result << row.inspect # hash
end
# easier one is
require 'csv_hasher'
arr_of_hashes = CSVHasher.hashify(data_file)