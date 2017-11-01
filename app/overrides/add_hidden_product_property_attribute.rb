Deface::Override.new(virtual_path: 'spree/admin/product_properties/index',
  name: 'add_hidden_attribute_to_product_property_index',
  insert_after: "erb[loud]:contains('Spree.t(:value)')",
  text: "
    <th><%= Spree.t(:hidden) %></th>
  ")
  
Deface::Override.new(virtual_path: 'spree/admin/product_properties/_product_property_fields',
  name: 'add_hidden_attribute_to_product_property_fields',
  insert_after: "td.value",
  text: "
    <td class='hidden_property'>
      <%= f.check_box :hidden %>
    </td>
  ")


Deface::Override.new(virtual_path: "spree/products/_properties", 
  name: "remove_hidden_product_properties_from_table", 
  insert_after: "erb[silent]:contains('@product_properties.each do |product_property|')",
  text: "
    <% next if product_property.hidden? %>
  ")