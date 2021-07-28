module ItemsHelper

    def price_to_dollars(cents)
        dollars = cents.to_f / 100
        '%.2f' % dollars
    end
end