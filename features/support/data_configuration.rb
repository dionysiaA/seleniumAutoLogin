require 'yaml'
require 'psych'
module ProfileConfig
  def self.read_data
    YAML.load_file('config/data.yml')
  end
end
World(ProfileConfig)
