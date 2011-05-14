class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  include BCrypt
  
  attr_accessor :password
  attr_accessible :username, :email, :password
  
  field :username
  field :email
  field :password_digest
  field :api_key
  field :admin, type: Boolean, default: false
  
  validates_uniqueness_of :username, :email
  
  has_many :posts
  
  before_create :generate_api_key
  
  def crypted_password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
  def self.authenticate(username, password)
    user = where(username: username).first
    if user && user.crypted_password == password
      user
    else
      nil
    end
  end
  
  private
    def generate_api_key
      u = UUID.new
      self.api_key = Digest::SHA512.hexdigest(u.generate)[0,32]
    end
  
end
