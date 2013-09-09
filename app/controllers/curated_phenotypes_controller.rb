class CuratedPhenotypesController < ApplicationController
  def show
  end

  def index
    @curated_phenotypes = CuratedPhenotype.order(sort_column + " "+ sort_direction)
    @curated_phenotypes_paginate = @curated_phenotypes.paginate(:page => params[:page],:per_page => 10)
  end
end
