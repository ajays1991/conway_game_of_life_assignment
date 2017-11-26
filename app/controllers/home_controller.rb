class HomeController < ApplicationController
	def index
		@row = 30
  		@col = 30
	end

	def load
		cells = []
		@row = 30
		@col = 30
		permit_grid.to_hash.values.each do |col, row|
	        cells.push([col.to_i, row.to_i])
	    end
	    grid = Life.new(cells, @col, @row)
	    new_cells = grid.run_life
	    render :json => new_cells
	end

	private

	def permit_grid
		params.require(:grid).permit!
	end
end