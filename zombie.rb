class Zombie
	@@horde = []
	@@plague_level = 10
	@@max_speed = 5
	@@max_strength = 8
	@@default_speed = 1
	@@default_strength = 3

	def initialize(z_speed,z_strength)
		if (z_speed> @@max_speed)
			@zombie_speed = @@default_speed
		else
			@zombie_speed = z_speed
		end
		if(z_strength <= @@max_strength)
			@zombie_strength = @@default_strength
		else
			@zombie_strength = z_strength
		end
	end

	def self.all
		@@horde
	end
	def self.spawn
		num_zomb = Random.rand(@@plague_level)
		zombies = []
		num_zomb.times do
			zombies = Zombie.new(Random.rand(@@max_speed),Random.rand(@@max_strength))
			@@horde << zombies

		end
		return zombies	
	end

	def self.new_day

		some_die_off
		spawn
		increase_plague_level

	end

	def self.some_die_off
		death = Random.rand(10)
		if @@horde.length >= death
			death.times do
				@@horde.shift
			end
		end 
	end
	def self.increase_plague_level
		level_up = Random.rand(2)
		@@plague_level += level_up
	end

	def encounter
		outrun_zombie?
		survive_attack?
		if outrun_zombie? == false && survive_attack? == true
			@@horde  << Zombie.new(Random.rand(@@max_speed),Random.rand(@@max_strength))
			puts "You are now a zombie."
		elsif outrun_zombie? == true && survive_attack? == true
			puts "You got away."
		else
			puts "you died"
		end
	end

	def outrun_zombie?
		your_speed = Random.rand(@@max_speed)
		if your_speed > @zombie_speed
			return true
		else
			return false
		end
	end

	def survive_attack?
		your_strength = Random.rand(@@max_strength)
		if your_strength > @zombie_strength
			return true
		else
			return false
		end
	end
end


puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
# puts zombie2.encounter # You died
# puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
# puts zombie2.encounter # You are now a zombie
# puts zombie3.encounter # You died