module ItemsHelper

    def price_to_dollars(cents)
        dollars = cents.to_f / 100
        '%.2f' % dollars
    end

    def product_image(item)
        return item.picture if item.picture.attached?
        # if no image is attached to an item return a default
        return 'RENT-Y-FiT_Logo.png'
    end
end