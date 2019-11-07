class Song < ApplicationRecord
    validates :title, presence: true
    validate :same_song_twice_in_a_year
    validate :released_with_release_year

    def same_song_twice_in_a_year
        if Song.find_by(title: self.title, release_year: self.release_year)
            errors.add(:release_year, "This Already Exists!")
        end
    end

    def released_with_release_year
        if released
            if release_year == nil || release_year > Date.today.year
                errors.add(:release_year, "Released status and released year do not match up!")
            end
        end
    end
end
