class ContributionSearchController < ApplicationController
  def index
    search_token = params[:search_token]
    results = Contribution.where("contributor_name like ?", "%#{search_token}%")

    respond_to do |format|
      format.json { render json: results }
    end
  end
end
