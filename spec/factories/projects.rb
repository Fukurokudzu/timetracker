FactoryBot.define do
  factory :project do
    user
    title { 'Some title' }
    salary_per_hour { 3600 }
  end
end
