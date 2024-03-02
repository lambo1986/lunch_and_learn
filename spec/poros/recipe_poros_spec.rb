require "rails_helper"

RSpec.describe Recipe do
  it "exists" do
    attrs =
        {
          recipe: {
            url: "http://www.edamam.com/ontologies/edamam.owl#recipe_65d644a713cab8e02704ddb75178dc64",
            label: "Chicken awesome good from home",
            image: "https://edamam-product-images.s3.amazonaws.com/web-img/d03/d03.jpg"
          }
        }

    recipe = Recipe.new(attrs)

    expect(recipe.id).to eq(nil)
    expect(recipe.type).to eq("recipe")
    expect(recipe.url).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_65d644a713cab8e02704ddb75178dc64")
    expect(recipe.title).to eq("Chicken awesome good from home")
    expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/d03/d03.jpg")
  end
end
