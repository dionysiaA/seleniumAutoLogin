module Users
  class User
    attr_accessor :liked_items, :name, :email, :password
    def initialize(name)
      user_data = ProfileConfig.read_users_profiles[name]
      @name = name
      @liked_items = user_data['liked_items']
      @email = user_data['email']
      @password = user_data['password']
    end

    def self.user_initialization(name)
      name = (name.nil?) ? 'default_user' : name
      User.new(rubyize(name))
    end
  end
end
World(Users)
