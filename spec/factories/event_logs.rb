# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_log do
    tenant_id 1
    user_name "eqbal"
    action "login_success"
    ip_address "66.211.160.86"
    user_agent "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36"
    city "MyString"
    state "MyString"
    country "MyString"
    postal_code "MyString"
    latitude 24.57882
    longitude 14.57863
    browser "Internet Explorer"
  end
end
