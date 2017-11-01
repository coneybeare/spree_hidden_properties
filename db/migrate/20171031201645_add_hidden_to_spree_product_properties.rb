class AddHiddenToSpreeProductProperties < SpreeExtension::Migration[5.1]
  def change
    add_column :spree_product_properties, :hidden, :bool, default: false
  end
end
