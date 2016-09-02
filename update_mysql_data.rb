require 'mysql'
require 'HTTParty'
require 'JSON'

begin
  con = Mysql.new 'localhost', 'root', '', 'autofill'
  api_url = "http://localhost:3007/products?issuer=v&product=n"
  response = HTTParty.get(api_url)
  body = response.body
  arr_of_hashes = JSON.parse(body)
  def insert_place(hash, con)
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
