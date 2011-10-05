@staffs
Feature: Staffs
  In order to have staffs on my website
  As an administrator
  I want to manage staffs

  Background:
    Given I am a logged in refinery user
    And I have no staffs

  @staffs-list @list
  Scenario: Staffs List
   Given I have staffs titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of staffs
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @staffs-valid @valid
  Scenario: Create Valid Staff
    When I go to the list of staffs
    And I follow "Add New Staff"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 staff

  @staffs-invalid @invalid
  Scenario: Create Invalid Staff (without name)
    When I go to the list of staffs
    And I follow "Add New Staff"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 staffs

  @staffs-edit @edit
  Scenario: Edit Existing Staff
    Given I have staffs titled "A name"
    When I go to the list of staffs
    And I follow "Edit this staff" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of staffs
    And I should not see "A name"

  @staffs-duplicate @duplicate
  Scenario: Create Duplicate Staff
    Given I only have staffs titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of staffs
    And I follow "Add New Staff"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 staffs

  @staffs-delete @delete
  Scenario: Delete Staff
    Given I only have staffs titled UniqueTitleOne
    When I go to the list of staffs
    And I follow "Remove this staff forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 staffs
 