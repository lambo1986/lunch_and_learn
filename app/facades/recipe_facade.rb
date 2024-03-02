class RecipeFacade
  def by_country(country)
    service = RecipeService.new
    call = service.get_rando_recipes_for_country(country)
    recipes = call[:hits].map { |recipe| Recipe.new(recipe) }
  end
end
