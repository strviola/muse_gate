FactoryGirl.define do
  factory :prefecture do
    id 13
    name '東京都'

    initialize_with do
      Prefecture.find_or_create_by(id: 13, name: '東京都')
    end
  end
end
