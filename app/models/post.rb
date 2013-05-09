class Post < ActiveRecord::Base
  
  attr_accessible :text, :title
  #  has_many :comments 
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
    length: { minimum: 5 }
  
  attr_accessible :attachment
  has_attached_file :attachment,
    :styles => {:tiny =>"25x25#",:small => "58x58#", :medium=>"100x100#", :normal=>"800x600", :profile=>"150x150#"}
  #,:processors => [:cropper]
  validates_attachment_presence :attachment
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates_attachment_content_type :attachment, :content_type => ['image/jpeg', 'image/png']

  scope :find_all, :conditions => ["published = ?", true]

end



