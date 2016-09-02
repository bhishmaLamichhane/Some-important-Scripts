require 'roo'
require 'csv'

def flat_hash(h,f=[],g={})
  return g.update({ f=>h }) unless h.is_a? Hash
  h.each { |k,r| flat_hash(r,f+[k],g) }
  g
end

xlsx = Roo::Spreadsheet.open('./Sample.xlsx')
xlsx = Roo::Excelx.new("./Sample.xlsx")
xlsx = Roo::Spreadsheet.open('./Sample.xlsx', extension: :xlsx)
sample = []
xlsx.each do |data|
  sample << data
end
keys = sample[0]
sample.shift
final = []
sample.each do |values|
  zipped = keys.zip(values)
  final << Hash[zipped]
end
final.each do |hash|
	hash.each do | key, value|
		if value.class == String
			if (value.start_with? "{") && (value.end_with? "}" )
				# the_hash = Hash.new
				# value[1..-2].split(/, /).each {|entry| entryMap=entry.split(/=>/); value_str = entryMap[1]; the_hash[entryMap[0].strip[1..-1].to_sym] = value_str.nil? ? "" : value_str.strip[1..-2]}
				hash[key] = eval(value)
		  	end
	  	end
	end
end
flat_final = []
final.each do |h|
  myHash = flat_hash(h)
  flat_final << Hash[myHash.map{ |k, v| [k.join('.'), v] }]
end
CSV.open("./lata.csv", "wb", :write_headers=> true, :headers => flat_final.first.keys ) do |csv|
    flat_final.each do |h|
      csv << h.values
    end
  end