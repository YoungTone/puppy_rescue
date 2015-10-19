class Puppy < ActiveRecord::Base
    validates :name, :age, :bio, presence: true
end
