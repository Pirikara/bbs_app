FactoryBot.define do
  factory :room do
    image            { "sample.png" }
    title            { 'test' }
    description      { 'test' }
    category_id      { 1 }
    host_id          { 1 }
  end
end
