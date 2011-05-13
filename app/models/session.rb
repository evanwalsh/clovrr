class Session
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Translation
  extend ActiveModel::Callbacks
    
  attr_accessor :username, :password
    
  validates_presence_of :username
  validates_presence_of :password

  define_model_callbacks :save
  
  def initialize(attributes={})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
  def save
    User.authenticate(username, password)
  end
end