class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  validates_presence_of :title, :body
  validates_uniqueness_of :title
  
  before_save :generate_url, :process_body
  
  field :title
  field :url
  field :body
  field :parsed_body
  
  private
    def generate_url
      self.url = title.parameterize
    end
    
    def process_body
      if self.new_record? || self.body.changed?
        self.parsed_body = Redcarpet.new(self.body).to_html
      end
    end
  
end