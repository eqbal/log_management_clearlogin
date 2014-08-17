class EventLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :tenant_id,   type: Integer
  field :user_name,   type: String
  field :action,      type: String
  field :ip_address,  type: String
  field :user_agent,  type: String
  field :city,        type: String
  field :state,       type: String
  field :country,     type: String
  field :postal_code, type: String
  field :latitude,    type: Float 
  field :longitude,   type: Float
  field :browser,     type: String

  scope :recent,  -> { where(:created_at.gte => 1.month.ago) }
  scope :action,  ->(a) { where(action: a)}
  scope :browser, ->(b) { where(browser: b)}
  scope :country, ->(c) { where(country: c)}
end