Given /^(?:now|today) is (.*)$/ do |time_or_date|
  Timecop.travel time_or_date
end

After do
  Timecop.return
end

Transform /^\d{4}-\d{2}-\d{2}$/ do |string|
  Date.parse(string)
end

