class Tamagotchi < ActiveRecord::Base
  validates_uniqueness_of :name, {:case_sensitive => false}
  before_create :set_initial_levels



private
  def set_initial_levels
    self.food_level = 10
    self.activity_level = 10
    self.sleep_level =10
    self.alive = true
  end
end
