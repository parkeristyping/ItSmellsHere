class SmellsController < ApplicationController
  def index
    @smells = Smell.all
  end
end
