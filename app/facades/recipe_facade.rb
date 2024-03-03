class RecipeFacade

  def by_country(country)
    service = RecipeService.new
    if country.present?
      recipes = fetch_recipes_for_country(country)
    else
      random_country = fetch_random_country
      recipes = fetch_recipes_for_country(random_country)
    end
    recipes
  end

  private

  def fetch_random_country
    Rails.cache.fetch("random_country", expires_in: 24.hours) do
      CountryService.new.random_country
    end
  end

  def fetch_recipes_for_country(country)
    Rails.cache.fetch("recipes_for_#{country}", expires_in: 12.hours) do
      service = RecipeService.new
      call = service.get_rando_recipes_for_country(country)
      call[:hits].map { |recipe| Recipe.new(recipe) }
    end
  end
end
