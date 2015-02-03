require 'spec_helper'

describe Tamagotchi do

  it('should only accept unique tamagotchi names') do
    t1 = Tamagotchi.new({:name => "Bob"})
    t1.save()
    t2 = Tamagotchi.new({:name => "Bob"})
    expect(t2.save()).to(eq(false))
  end

  describe '#initialize' do
    it 'tests to see if initial values are correct' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      expect(test_pet.name()).to(eq('Bruce'))
      expect(test_pet.food_level()).to(eq(10))
      expect(test_pet.activity_level()).to(eq(10))
      expect(test_pet.sleep_level()).to(eq(10))
    end
  end

  describe '#time_passes' do
    it 'decreases the food, activity and sleep amount by 1' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      test_pet.time_passes
      expect(test_pet.food_level()).to(eq(9))
      expect(test_pet.activity_level()).to(eq(9))
      expect(test_pet.sleep_level()).to(eq(9))
    end
  end

  describe '#is_alive?' do
    it 'is alive if each level is greater than 0' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      expect(test_pet.is_alive?).to(eq(true))
    end

    it 'is dead if food level is 0' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      test_pet.set_food_level(0)
      expect(test_pet.is_alive?).to(eq(false))
    end

    it 'is dead if activity level is 0' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      test_pet.set_activity_level(0)
      expect(test_pet.is_alive?).to(eq(false))
    end

    it 'is dead if sleep level is 0' do
      test_pet = Tamagotchi.create({:name => 'Bruce'})
      test_pet.set_sleep_level(0)
      expect(test_pet.is_alive?).to(eq(false))
    end
  end

end
