class Vampire
	@@coven = []
	def initialize(vname,age,coffin, drank)
		@name = vname
		@age = age
		@in_coffin = coffin
		@drank_blood_today = drank
	end
	def self.create(vname,age,coffin, drank)
		vamp = Vampire.new(vname,age,coffin, drank)
		@@coven << vamp
		return vamp
	end
	def drank_blood?
		@drank_blood_today
	end
	def at_home?
		@in_coffin
	end

	def drink_blood?(drink)
		@drank_blood_today = drink
	end
	def go_home?(sleep)
		@in_coffin = sleep
	end
	def self.sunrise
		@@coven.each do |vampires|
			if vampires.drank_blood? == false || vampires.at_home? == false
				@@coven.delete(vampires)
			end
		end
	end
	def self.sunset
		@@coven.each do |vampires|
			vampires.drink_blood?(false)
			vampires.go_home?(false)
		end
	end
end
vampy = Vampire.create("vampy", 12, false, false)
vlad = Vampire.create("vlad",2000, false, true)
puts vampy.drank_blood?
puts vlad.at_home?
puts Vampire.sunset.inspect
puts Vampire.sunrise.inspect