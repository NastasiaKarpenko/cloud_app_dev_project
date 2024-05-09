FactoryBot.define do
    factory :article do
      title { "Sample Article" }
      body { "Sample body content of the article." }
      published { false }
    end
  end