#require 'save_campaigns/campaign'
module SAVE_CAMPAIGN
  class << self
    attr_accessor :username
    attr_accessor :password
    attr_accessor :url
    #attr_accessor :timeout
    #attr_accessor :open_timeout
  end
  def self.configure(&block)
    yield(self)
  end
end

