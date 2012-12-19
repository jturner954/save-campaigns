module SAVE_CAMPAIGN
  class Campaign
    attr_accessor :username, :password, :url #, :timeout, :open_timeout
    def initialize(args={})
      @username = SAVE_CAMPAIGN.username
      @password = SAVE_CAMPAIGN.password
      @url = SAVE_CAMPAIGN.url
      #@timeout = SAVE_CAMPAIGN.timeout.to_i
      #@open_timeout = SAVE_CAMPAIGN.open_timeout.to_i
      #  @street_address = @street_address_2 = @city = @state = @zip_code = @status = @status_msg = @request = @response = @record_type = @error = ''
      #  @is_valid = false
      #  @street_address = args[:street_address] if args[:street_address]
      #  @street_address_2 = args[:street_address_2] if args[:street_address_2]
      #  @city = args[:city] if args[:city]
      #  @state = args[:state] if args[:state]
      #  @zip_code = args[:zip_code] if args[:zip_code]
      begin
        self.connection = RForce::Binding.new @url
        response = self.connection.login @username, @password
        dbg response
      rescue Exception=>e
        dbg e
      end
    end

  def get_campaigns
    result = self.connection.query( queryString: "SELECT externalcampaignid__c, campaignid__c, name, channel__c, affiliate_marketing_type__c, phone__c  FROM Campaign")

    #  Campaign ID             - ExternalCampaignId__c            - Text(10)
    #  Campaign ID             - CampaignID__c                    - Lookup(Campaign ID)
    #  Campaign Name           - Name                             - Text(80)
    #  Marketing Channel       - Channel__c                       - Picklist
    #  Marketing Channel       - Affiliate_Marketing_Type__c      - Picklist
    #  Toll Free Phone Number  - Phone__c                         - Phone
  end

  end
end

