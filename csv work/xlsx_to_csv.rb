require 'roo'
require 'csv'

xlsx = Roo::Spreadsheet.open('./prpt.xlsx')
xlsx = Roo::Excelx.new("./prpt.xlsx")
xlsx = Roo::Spreadsheet.open('./prpt.xlsx', extension: :xlsx)
sample = []
xlsx.each(identifier: "input.identifier", url: "input.image_url", batch_id: "input.batch_id", accusoft: "input.accusoft", date: "output.ticket_date",type: "output.ticket_type", law_code: "output.law_code", city: "output.city", number: "output.ticket_number", license: "output.license",plate_number: "output.plate_number", registration: "output.registration", cost: "output.cost", wotk_duration: "meta.total_work_duration", no_of_skipped: "meta.total_number_of_skipped", workers: "meta.workers",meta_id: "meta.id", meta_status: "meta.status", created_at: "meta.created_at", processed_at: "meta.processed_at", turnaround_time: "meta.turnaround_time", run_id: "meta.run_id") do |hash|
  sample << hash
end
sample.shift
meta_run_ids = []
sample.each do |data|
	meta_run_ids << data[:run_id]
end
meta_run_id_count = meta_run_ids.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }


created_date = ""
CSV.open('prpt_check2.csv', 'wb', :write_headers=> true, :headers => ["Meta_run_id","Count","Created_at"] ) do |csv|
    meta_run_id_count.each do |key,val|
    		sample.each do |data|
    			if(key == data[:run_id])
    				created_date = data[:created_at]
    				break
    			end
    		end
        csv << [ key, val , created_date]
    end
end

#sheet = xlsx.sheet(0).row(1)
