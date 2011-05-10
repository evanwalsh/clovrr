class User
  include Mongoid::Document
  include Mongoid::Paranoia
  include Mongoid::Timestamps
  include BCrypt
  
  field :username
  field :email
  field :password_digest
  
  validates_uniqueness_of :username, :email
  
  before_save :generate_password_digest
  
  def self.authenticate(username, password)
    @user = User.where(username: username).first
    if @user.present? and password == @user.password
      @user
    end
  end
  
  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
  
  private
    def generate_password_digest
      self.password_digest = Password.create(self.password)
    end
end
