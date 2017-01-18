module KnowsAboutTheEnvironment
  def test_data(data_type, param)
    data = test_data_sample(data_type)
    data = data[param.to_s.gsub(' ', '_').downcase]
    fail "Unable to find variable [#{param}] in the test data set of [#{data_type}] for environment '#{ENV['SERVER']}'" if data.nil?
    data
  end

  def test_data_sample(param)
    data = initialise_test_data
    data = data[param.to_s.gsub(' ', '_').downcase]
    fail "Unable to find variable [#{param}] in the test data for environment '#{ENV['SERVER']}'" if data.nil?
    data
  end

  def initialise_test_data
    test_data ||= ProfileConfig.read_data
    server_env = ENV['SERVER'].upcase
    if test_data[server_env].nil?
      fail "Test data for environment '#{server_env}' are not defined in config/data.yml"
    end
    test_data[server_env]
  end
end

extend KnowsAboutTheEnvironment
include KnowsAboutTheEnvironment
World(KnowsAboutTheEnvironment)

