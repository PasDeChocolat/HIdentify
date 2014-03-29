class ContributionSearchController < ApplicationController
  def index
    grouping = Grouping.find(params[:grouping_id])

    search_token = params[:search_token]



    results = Contribution.where("contributor_name ilike ?", "%#{search_token}%")
    results = results.map do |c|
      h = c.attributes
      h['is_matched'] = grouping.contributions.include?(c)
      h['formatted_full_address'] = c.formatted_full_address
      h
    end

    respond_to do |format|
      format.json { render json: results }
    end
  end

  def match_add
    puts "PUT match_params:"
    puts match_params

    grouping = Grouping.find(match_params[:grouping_id])
    contribution = Contribution.find(match_params[:contribution_id])

    search_token = match_params[:search_token]
    matches = grouping.matches.where(search_token: search_token, contribution_id: contribution.id)

    match = nil
    if matches.empty?
      match = grouping.matches.create(search_token: search_token)
      match.contribution = contribution
    end

    respond_to do |format|
      if match.nil? || match.save
        format.json { head :no_content }
      else
        format.json { render json: ["error"], status: :unprocessable_entity }
      end
    end
  end

  def match_delete
    puts "DELETE match_params:"
    puts match_params

    grouping = Grouping.find(match_params[:grouping_id])
    contribution = Contribution.find(match_params[:contribution_id])

    search_token = match_params[:search_token]
    matches = grouping.matches.where(search_token: search_token, contribution_id: contribution.id)

    respond_to do |format|
      if matches.empty?
        # match = grouping.matches.create(search_token: search_token)
        # match.contribution = contribution
        format.json { head :no_content }
        return
      else
        grouping.matches.delete matches.first
        if grouping.save
          format.json { head :no_content }
        else
          format.json { render json: ["error"], status: :unprocessable_entity }
        end
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.permit(:contribution_id, :search_token, :grouping_id)
    end
end
