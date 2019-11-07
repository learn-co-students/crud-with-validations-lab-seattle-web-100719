class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    with_options if: :released? do |release|
        release.validates :release_year, presence: true 
        release.validates :release_year, numericality: { less_than: Date.today.year  }
    end

    def released?
        released == true
    end
end
