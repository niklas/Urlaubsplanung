Given /^I am logged in as #{capture_model}$/ do |user|
  unless user.include?('the')
    Given %{#{user} exists}
  end
  user = model!(user)
  Given %{I am on the home page}
   When %{I follow "einloggen"}
    And %{I fill in "Email" with "#{user.email}"}
    And %{I fill in "Passwort" with "#{Factory::DefaultPassword}"}
    And %{I press "einloggen"}
   Then %{I should see "Erfolgreich eingeloggt"}
    And %{I should be logged in as "#{user.email}"}
end

Given /^I am not logged in$/ do
  if response.present?
    Given %{I should see "login" within "#session"}
  else
    true
    # nothing visited yet
  end
end

Given /^I am logged in$/ do
  Given %{a confirmed_user "me" exists}
    And %{I am logged in as confirmed_user "me"}
end

When /^I log in$/ do
  Given %~I am logged in~
end

When /^I log out/ do
  When %~I follow "ausloggen"~
  Then %~I should see "Erfolgreich ausgeloggt"~
end

When /^I log in as #{capture_model}$/ do |model|
  Given %~I am logged in as #{model}~
end


Then /^I should be logged in as "([^"]*)"$/ do |name|
  Then %{I should see "#{name}" within "#session"}
end
