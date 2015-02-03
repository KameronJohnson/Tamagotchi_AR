class Tamagotchi < ActiveRecord::Base
  validates_uniqueness_of :name, {:case_sensitive => false}
  before_create :set_initial_levels


  def time_passes
    self.food_level -= 1
    self.activity_level -=1
    self.sleep_level -=1
    self.save
  end

  def is_alive?
    if (food_level & activity_level & sleep_level > 0)
      self.alive = true
    else
      self.alive = false
    end
  end

  def set_food_level (food_level)
    self.food_level = food_level

  end

  def set_activity_level (activity_level)
    self.activity_level = activity_level

  end

  def set_sleep_level (sleep_level)
    self.sleep_level = sleep_level

  end

private
  def set_initial_levels
    self.food_level = 10
    self.activity_level = 10
    self.sleep_level =10
    self.alive = true
  end
end
