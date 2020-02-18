FactoryBot.define do
  factory :room do
    title            { 'test' }
    description      { 'test' }
    host_id          { 1 }
    category_ids     { 1 }
  end
end
