json.array! @customers do |customer|
  json.name customer.name
  json.tel customer.tel
  json.day customer.day
  json.time customer.time
  json.people customer.people
  json.text customer.text
  # json.table_name customer.table.name
end