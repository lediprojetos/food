class FdItemalterado < ActiveRecord::Base
  belongs_to :fd_itempedido
  belongs_to :fd_item, :class_name => "FdItem", :foreign_key => "fd_items_id"

end
