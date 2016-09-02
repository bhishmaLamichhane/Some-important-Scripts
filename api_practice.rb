require 'CSV'
require 'HTTParty'
require 'JSON'

#post
array=[]
CSV.foreach('/Users/../Downloads/try.csv', headers:true) do |row|
	prepare_hash
	array<<hash
end
array=array.each_slice(2).to_a
body = {
  	JSON_body
	}

array.each do |units|
	api_url = "http://username:password@localhost:3000/.../..."

	body.merge!(units: units.to_json)

	HTTParty.post(api_url, body: body)

end

# get
api_url = "http://username:password@localhost:3000/.../..."
response = HTTParty.get(api_url)
body = response.body