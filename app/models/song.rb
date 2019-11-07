class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year]}
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true
    validate :optional_year
    
    def optional_year
        if released
            if release_year == nil or release_year > Date.today.year
                errors.add(:release_year, "No release year")
            end
        end
    end
end
