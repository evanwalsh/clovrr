class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  
  validates_presence_of :title
  validates_uniqueness_of :title
  
  belongs_to :user
  
  before_save :generate_url, :parse_body
  
  field :title
  field :url
  field :body
  field :parsed_body
  field :link
  
  scope :year, ->(year) { where(created_at: { 
      '$gte' => Time.utc(year), 
      '$lte' => Time.utc(year).end_of_year 
    })
  }
  scope :month_of_year, ->(month, year) { where(created_at: {  
      '$gte' => Time.utc(year, month).beginning_of_month, 
      '$lte' => Time.utc(year, month).end_of_month 
    }) 
  }
  
  def reparse_body!
    parse
    save
  end
  
  def kind
    if self.link.present?
      'link'
    else
      'text'
    end
  end
  
  private
    def generate_url
      self.url = title[0, 32].parameterize
    end
    
    def parse_body
      if self.new_record? && body.present? || self.body_changed?
        parse
      end
    end
    
    def parse
      self.parsed_body = Redcarpet.new(self.body).to_html
    end
  
end