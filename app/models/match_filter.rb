class MatchFilter 

  def initialize(scope)
    @scope = scope
  end

  def filter(params)
    filter_by_industry params[:industry_ids]
  end

  private

  def filter_by_industry(industry)
    @scope = @scope.where('industry LIKE?', "%#{industry}%")
  end
end