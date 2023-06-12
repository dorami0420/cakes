class Item < ApplicationRecord
  has_one_attached :image
has_many :order_details  
  

def get_item_image(hight, width)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [hight, width]).processed
end

def with_tax_price
    (price * 1.1).floor
end

def add_tax_sales_price
  (self.price * 1.10).round
end

private

end
