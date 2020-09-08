
class ShortUrlService
    SERVICE_URL  = "https://api-ssl.bitly.com/v4/shorten"
    POST_HEADERS = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer 18ddd4d890048f4aaeb542aee3d8e450e7b496f4"
    }

    def self.shorten(url)
        response = HTTParty.post(SERVICE_URL, headers: POST_HEADERS, body: {
            long_url: url
        }.to_json)

        if [200, 201].include?(response.code)
            JSON.parse response.body
        else
            nil
        end
    end
end
