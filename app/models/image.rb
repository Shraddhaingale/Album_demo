class Image < ActiveRecord::Base
 belongs_to :album ,inverse_of: :images
 belongs_to :user
 validates_associated :album
 has_attached_file :avatar, :styles => { :small => "150x150>", :large => "320x240>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
validates_attachment_presence :avatar
validates_attachment_size :avatar, :less_than => 5.megabytes
validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
 
end
