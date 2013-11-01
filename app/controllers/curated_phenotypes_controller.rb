class CuratedPhenotypesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    # get all possible curated phenotypes, and get all possible answers for each
    @curated_phenotypes = CuratedPhenotype.all
  end

  def create
  end

  def show
    @curated_phenotype = CuratedPhenotype.find_by_id(params[:id]) || not_found
    @users = @curated_phenotype.users
  end

  def index
    @curated_phenotypes = CuratedPhenotype.order(sort_column + " "+ sort_direction)
    @curated_phenotypes_paginate = @curated_phenotypes.paginate(:page => params[:page],:per_page => 10)
    respond_to do |format|
      format.html
    end
  end

  def update
  end
  private

  def sort_column
    CuratedPhenotype.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[desc asc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end

