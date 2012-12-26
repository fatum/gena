require 'spec_helper'

describe "<%= app_class_name %>" do
  include Rack::Test::Methods

  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
end

