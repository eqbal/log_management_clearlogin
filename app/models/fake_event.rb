require "faker"

class FakeEvent
  Actions = %w[login_success logout login_failure invalid_ip change_password]

  Agents  = [
    "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)"  <<
    " Chrome/37.0.2049.0 Safari/537.36",
    "Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLC" << 
    "C1; .NET CLR 3.0.4506.2152; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0",
    "Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14",
    "Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0",
    "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Geck" << 
    "o) Version/6.0 Mobile/10A5355d Safari/8536.25",
    "Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/5" << 
    "34.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30",
    "Mozilla/5.0 (compatible; MSIE 9.0; AOL 9.7; AOLBuild 4343.19; Windows NT 6.1; WOW" <<
    "64; Trident/5.0; FunWebProducts)"
  ]

  def initialize(params={})
    @action      = params.fetch(:action, action_sample)
    @tenant_id   = params.fetch(:tenant_id, random_id)    
    @user_name   = params.fetch(:user_name, Faker::Name.name)    
    @created_at  = params.fetch(:created_at, rand_time(60.days.ago))
    @ip_address  = params.fetch(:ip_address, random_ip)
    @user_agent  = params.fetch(:user_agent, user_agent.to_s)
    @browser     = params.fetch(:browser, user_agent.browser)
    @city        = params.fetch(:city, Faker::Address.city)
    @state       = params.fetch(:state, Faker::Address.state)
    @country     = params.fetch(:country, Faker::Address.country)
    @postal_code = params.fetch(:postal_code, Faker::Address.postcode)
    @latitude    = params.fetch(:latitude, Faker::Address.latitude)
    @longitude   = params.fetch(:longitude, Faker::Address.longitude)
  end

  def to_h
    {
      action:      @action,       
      tenant_id:   @tenant_id,
      user_name:   @user_name,    
      created_at:  @created_at,   
      ip_address:  @ip_address,   
      user_agent:  @user_agent,   
      browser:     @browser,       
      city:        @city,          
      state:       @state,        
      country:     @country,      
      postal_code: @postal_code,  
      latitude:    @latitude,     
      longitude:   @longitude          
    }
  end

  def save
    EventLog.create(self.to_h)
  end

  private

  def action_sample
    Actions.sample
  end

  def agent_sample
    Agents.sample
  end

  def random_id(min=1, max=10_000)
    rand(min..max)
  end

  def rand_time(from = 0.0, to = Time.now)
    Time.at(from + rand * (to.to_f - from.to_f))
  end

  def random_ip
    Array.new(4){rand(256)}.join('.')
  end

  def user_agent(data=agent_sample)
    UserAgent.parse(data)
  end
end
