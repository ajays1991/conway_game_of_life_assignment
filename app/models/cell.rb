class Cell
	attr_accessor :life, :x, :y
	def initialize(life, x, y)
		@life = life
		@x = x
		@y = y
		@live = evaluate_cell_life
	end

	def evaluate_cell_life
		life.cells.any? {|n| n[0] == y and n[1] == x}
	end

	def alive_neighbours
		self.neighbours.select{|n| !n.nil? and n.live?}
	end

	def live?
		@live
	end

	def live!
		@live = true
	end

	def neighbours
		neighbours = []
		(-1..1).inject [] do |values, py|
	        (-1..1).each do |px|
		        unless py == 0 and px == 0		     
		            i = y + py
		            j = x + px
		            i = 0 unless i < life.rows
		            j = 0 unless j < life.cols		            	    
		            neighbours << life.grid[i][j]		        	
		        end
	        end
	    end	    
	    neighbours
	end

	def evaluate_next_generation
		if self.live?
			return [2, 3].include?(self.alive_neighbours.count) 
		else
			return self.alive_neighbours.count == 3
		end
	end
end
