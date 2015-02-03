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

  # describe '#is_alive' do
  #   it 'is alive if food level above 0' do
  #     pet = Tamagotchi.create({:name => 'Bruce'})
  #     expect(pet.is_alive).to(eq(true))
  #   end
  # end
end
