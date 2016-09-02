# require 'benchmark'
# Benchmark.measure { "a"*1_000_000 }
Benchmark.bm(7) do |x|
	x.report("as_json:") do
	  csv_string = CSV.generate do |csv|
      keys = tx_result['keys']
      row_data = tx_result['results']
      csv << keys
      row_data.each do |result|
        csv << result.map do |res|
          res.as_json
        end
      end
    end
	end

	x.report("to_json:") do
	  csv_string = CSV.generate do |csv|
      keys = tx_result['keys']
      row_data = tx_result['results']
      csv << keys
      row_data.each do |result|
        csv << result.map do |res|
          res.to_json
        end
      end
    end
	end
end