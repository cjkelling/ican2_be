class MeetupService

  def self.get_meetups(zip, radius)
    json = self.get_json(zip, radius)
  end

  private

    def self.connection(zip, radius)
      Faraday.new(url: 'https://api.meetup.com/find/groups') do |f|
        f.authorization :Bearer, ENV["MEETUP_TOKEN"]
        f.params[:zip] = zip
        f.params[:radius] = radius
        f.adapter Faraday.default_adapter
      end
    end

    def self.get_json(zip, radius)
      response = self.connection(zip, radius).get
      JSON.parse(response.body, symbolize_names: true)
    end
end
