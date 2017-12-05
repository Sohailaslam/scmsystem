class Section < ActiveRecord::Base
    has_many :students, :dependent => :destroy
    has_many :payments, :dependent => :destroy
end
