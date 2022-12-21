FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    email                {Faker::Internet.free_email}
    password=             Faker::Lorem.characters(number:8, min_alpha: 1, min_numeric: 1)
    password             {password}
    password_confirmation{password}
    nickname             {Faker::Name.initials(number: 2)}
    first_name           {person.first.kanji}
    last_name            {person.last.kanji}
    first_name_reading   {person.first.katakana}
    last_name_reading    {person.last.katakana}
    birthday             {Faker::Date.backward}

  end
end