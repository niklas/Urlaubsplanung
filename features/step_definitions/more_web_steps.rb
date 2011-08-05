Then /^I should see the following (.*)table:$/ do |kind,expected|
  selector = kind.strip.split.map {|c| ".#{c}" }.join
  actual = table(tableish("table#{selector} thead tr, table#{selector} tbody tr", 'th,td'))
  expected.diff! actual
end

