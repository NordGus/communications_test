require "test_helper"

class Person::ValidationsTest < ActiveSupport::TestCase
  test "valid" do
    person = Person.new(
      name: "Lilly Wachowski",
      birthdate: 40.years.ago
    )

    assert person.valid?
  end

  test "invalid because name is blank" do
    person = Person.new(birthdate: 40.years.ago)

    assert_not person.valid?
    assert_equal [{:error=>:blank}], person.errors.details[:name]
  end

  test "invalid because birthdate is blank" do
    person = Person.new(name: "Lilly Wachowski")

    assert_not person.valid?
    assert_equal [{:error=>:blank}], person.errors.details[:birthdate]
  end
end