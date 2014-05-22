require 'uri'

RSpec::Matchers.define :redirect_to do |expected_path|
  match do |response|
    response.status == 302 && URI.parse(response.location).path == expected_path
  end

  failure_message_for_should do |response|
    if response.status != 302
      "Expected a redirect but none received (actual HTTP response code was #{response.status})"
    else
      actual_path = URI.parse(response.location).path
      "Expected respnse to redirect to '#{expected_path}' but it redirected to #{actual_path}"
    end
  end
end
