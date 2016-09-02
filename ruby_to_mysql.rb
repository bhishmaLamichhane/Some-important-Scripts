require 'pry'
require 'mysql'
# require 'activeresource'
# require 'csv_hasher'
require 'HTTParty'
require 'JSON'

begin
  con = Mysql.new 'localhost', 'root', '', 'autofill'
  # arr_of_hashes = CSVHasher.hashify('/Users/.../Desktop/aa.csv')
  # api_url = "http://localhost:3007/products?issuer=a&product=a"
  api_url = "http://localhost:3007/products?issuer=v&product=n"
  response = HTTParty.get(api_url)
  body = response.body
  arr_of_hashes = JSON.parse(body)
  # binding.pry
  def insert_place(hash, con)
    # con.query("INSERT IGNORE INTO voucher(issuer, product, product_code) VALUES('#{hash[:issuer]}', '#{hash[:product]}', '#{hash[:product_code]}');")
    con.query("INSERT IGNORE INTO voucher(id, product, product_code) VALUES('#{hash["id"]}', '#{hash["product"]}', '#{hash["product_code"]}');")
  end
  arr_of_hashes.each do |hash|
    insert_place(hash, con)
  end

  rescue Mysql::Error => e
    puts e.errno
    puts e.error

  ensure
    con.close if con
end
