class Article < ApplicationRecord
    ################################################################## Callbacks
    after_create :add_text
    self.inheritance_column = :_type_disabled

    private

    def add_text
        self.update(text: Faker::Lorem.paragraph)
    end
end
