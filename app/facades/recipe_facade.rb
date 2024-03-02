class RecipeFacade
  def by_country(country)
    service = RecipeService.new
    if country.present?
      call = service.get_rando_recipes_for_country(country)
      recipes = call[:hits].map { |recipe| Recipe.new(recipe) }
    else
      random_country = CountryService.new.random_country
      call = service.get_rando_recipes_for_country(random_country)
      recipes = call[:hits].map { |recipe| Recipe.new(recipe) }
    end
  end
end
