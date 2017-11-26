require 'test_helper'

class CellTest < Minitest::Test
  
  def setup
  	cells = [[0, 0], [0, 1], [0, 2], [0, 4], [1, 0], [1, 3], [2, 4], [4, 1], [4, 3]]
  	@life = Life.new(cells, 5, 5)
  	# for cell in row=0, column=1
  	@cell = Cell.new(@life, 1, 0)
  	# for cell in row=4, column=3
  	@cell_2 = Cell.new(@life, 3, 4)
  	# for cell in row=4, column=1
  	@cell_3 = Cell.new(@life, 1, 4)
  	# for cell in row=4, column =2
  	@cell_4 = Cell.new(@life, 2, 4)
  	# for cell in row=0, column=4
  	@cell_5 = Cell.new(@life, 4, 0)
  end

  def test_live_neighbours_for_cell
  	assert_equal 4, @cell.alive_neighbours.count
  	assert_equal 2, @cell_2.alive_neighbours.count
  end

  def test_cell_is_live  	
  	assert @cell_2.live?
  end

  def test_cell_is_dead
  	refute @cell_4.live?
  end

  def test_overpopulation_death_for_cell
  	refute @cell.evaluate_next_generation
  end

  def test_underpopulation_death_for_cell
  	refute @cell_5.evaluate_next_generation
  end

  def test_life_for_cell
  	cell = Cell.new(@life, 2, 1)
  	assert cell.evaluate_next_generation
  end
end
