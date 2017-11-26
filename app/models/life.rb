class Life
	attr_accessor :cells, :cols, :rows, :grid
	def initialize(cells, cols, rows)
		@cols = cols
		@rows = rows
		@cells = cells
		@grid = []
		@rows.times do |y|
			@grid.push([])
			@cols.times do |x|
				@grid[y].push(Cell.new(self, x, y))
			end
		end
	end

	def run_life
		new_grid = []
		grid.each_with_index do |row, y|
			new_grid.push([])
		    row.each_with_index do |cell, x|		    	
		    	new_grid[y][x] = cell.evaluate_next_generation
		    end
	    end
		return new_grid;
	end
end
