require 'net/http'

url = URI.parse('http://maps.googleapis.com/maps/api/geocode/json?address=kathmandu')
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
puts res.body

Execute the event every night at 00:20
CREATE EVENT my_event
  ON SCHEDULE
    EVERY 1 DAY
    STARTS '2014-04-30 00:20:00' ON COMPLETION PRESERVE ENABLE
  DO
      # My query

Execute the event once the 2014-05-01 at 00:20 Max.
CREATE EVENT my_event
  ON SCHEDULE
    AT ('2014-04-30 00:20:00'+ INTERVAL 1 DAY) ON COMPLETION PRESERVE ENABLE
  DO
    # My query

    $ curl -X GET 'http://localhost:9200/myindex/item/_search?from=0&size=0' -d '
    {"from": 0,
    "size": 0,
    "facets": {
      "sourceResource.subject.name": {
        "global": true,
        "terms": {
          "order": "count",
          "size": 20,
          "all_terms": true,
          "field": "sourceResource.subject.name.not_analyzed"
        }
      }
    },
    "sort": [
      {
        "_score": "desc"
      }
    ],
    "query": {
      "filtered": {
        "query": {
          "match_all": {}
        }
      }
    }
  }' | jq -r '.facets["subject"].terms[] | [.term, .count] | @csv'





INSERT INTO 'vouchers' ('issuer','product','product_code')
VALUES ('ATD travel service ltd.','CITYSIGHTS ALL AROUND TOWN TOUR-360 Package','-');
ON DUPLICATE KEY UPDATE time = VALUES(time), user_id = VALUES(user_id)




