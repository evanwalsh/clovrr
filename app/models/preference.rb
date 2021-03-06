class Preference
  include Mongoid::Document
  include Mongoid::Timestamps
  
  validates_presence_of :name, :value
  validates_uniqueness_of :name
  
  field :name
  field :value
  
  before_save :process_name
  
  def self.get(name)
    preference = where(name: name).first
    if preference
      preference.value
    else
      "preference '#{name}' is not set"
    end
  end
  
  private
    def process_name
      self.name = name.to_s.parameterize('_')
    end
  
end
