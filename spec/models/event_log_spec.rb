require 'rails_helper'

RSpec.describe EventLog, :type => :model do
  let(:event_log) { create(:event_log) }

  it "Should create created_at when we create a record" do
    expect(event_log.created_at).not_to be_nil
  end

  it "Should modify updated_at when we make changes to record" do
    previous_updated_at = event_log.updated_at
    event_log.touch
    expect(event_log.updated_at).not_to eq(previous_updated_at)
  end

  

end
