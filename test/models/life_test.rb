require 'test_helper'

class LifeTest < Minitest::Test
  
  def setup
  	cells = [[0, 0], [0, 2], [0, 4], [1, 0], [1, 3], [2, 4], [4, 1]]
  	@life = Life.new(cells, 5, 5)
  end

  def test_run_life
  	grid = @life.run_life
  	# asserstions for all live cells
  	assert grid[0][0]
  	assert grid[0][2]
  	assert grid[0][3]
  	assert grid[0][4]
  	assert grid[1][0]
  	assert grid[1][1]
  	assert grid[1][3]
  	assert grid[2][4]
  	assert grid[4][0]
  	assert grid[4][1]  	
  end
end
