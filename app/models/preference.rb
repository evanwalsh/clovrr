class Preference
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  validates_presence_of :name, :value
  validates_uniqueness_of :name, :pretty_name
  
  field :name
  field :value
  field :pretty_name
  
  def self.get(name)
    where(name: name).first.value
  end
  
end
