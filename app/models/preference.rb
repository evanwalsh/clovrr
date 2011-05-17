class Preference
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  validates_presence_of :name, :value
  validates_uniqueness_of :name
  
  field :name
  field :value
  
  before_save :process_name
  
  def self.get(name)
    where(name: name).first.value
  end
  
  private
    def process_name
      self.name = name.parameterize('_')
    end
  
end
