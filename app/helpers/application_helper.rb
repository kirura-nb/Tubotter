module ApplicationHelper
    def distance_in_words_japanese(days)
        if days <= 7
          I18n.t('datetime.distance_in_words.x_days', count: days)
        else
          years = days / 365
          months = (days % 365) / 30
          remaining_days = days % 30
          I18n.t('datetime.distance_in_words.x_days_over_7', years: years, months: months, days: remaining_days)
        end
      end
end
