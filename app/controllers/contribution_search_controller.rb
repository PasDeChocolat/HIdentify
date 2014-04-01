class ContributionSearchController < ApplicationController
  def criteria_search
    grouping = Grouping.find(params[:grouping_id])
    criteria = params[:criteria]
    criteria_ast = JSON.parse(criteria)

    # For now, this works (assume all 'ands')
    and_criteria = criteria_ast.drop(1)

    results = Contribution
    and_criteria.each do |crit|
      search_type = crit['type']
      search_val = crit['v']
      results = results.where("#{search_type} ilike ?", "%#{search_val}%")
    end

    results = results.map do |c|
      h = c.attributes

      matches = c.matches.where(grouping: grouping)

      # isMatched = grouping.contributions.include?(c)
      isMatched = !matches.blank?
      h['is_matched'] = isMatched
      h['match_id'] = matches.first.id if isMatched

      h['formatted_full_address'] = c.formatted_full_address
      h
    end

    respond_to do |format|
      format.json { render json: results }
    end
  end

  def match_add
    grouping = Grouping.find(match_params[:grouping_id])
    contribution = Contribution.find(match_params[:contribution_id])
    criteria = params[:criteria]
    matches = grouping.matches.where(search_token: criteria, contribution_id: contribution.id)
    unless matches.empty?
      respond_to do |format|
        format.json { head :no_content }
        return
      end
    end

    match = grouping.matches.create(search_token: criteria)
    match.contribution = contribution

    respond_to do |format|
      if match.save
        format.json { render json: match }
      else
        format.json { render json: ["error"], status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.permit(:contribution_id, :search_token, :grouping_id, :criteria)
    end
end
