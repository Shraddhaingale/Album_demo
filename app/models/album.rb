class Album < ActiveRecord::Base

  #----------Association------------
  belongs_to :user
  has_many :images , inverse_of: :album
  #-----------validations------------
  validates_length_of :images, within: 0..8 ,:message => "abc"
  validates :album_name,:presence => { :message => "Please Enter Album Name"}, :length => {:maximum => 50, :message => "Album Name is not more than 50 Characters" }

end
