# require 'pry'
require 'csv'
require 'HTTParty'
url_size = []
count = 0
CSV.foreach('expensify_pdf_urls.csv', headers: true) do |row|
  count = count + 1
  # next if count < 2113
  url = row['pdf_url']
  file_url = URI.parse(url)
  response = HTTParty.head(file_url)
  file_size = response.headers["content-length"].to_i/1000
  url_size << [url, file_size]
end;nil
CSV.open('expensify_urls_with_size.csv', 'ab') do |csv|
  url_size.each do |url|
    csv << url
  end
end
CSV.open('remaining_expensify_urls_with_size.csv', 'wb') do |csv|
  csv << ['url', 'size(MB)']
  url_size.each do |url|
    csv << url
  end
end
CSV.open('test.csv', 'ab') do |csv|
  csv << ['test', '1']
end