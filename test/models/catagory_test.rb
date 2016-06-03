require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    # by convention setup runs before any test
    # the tests use a test database that is cleared after every test_helper 
    def setup
        @category = Category.new( name: "sports")
    end
    
    #google active record assertions for more on testing
    test "category should be valid" do
        assert @category.valid?
    end
    
    # validation test
    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end
    
    #unique test
    test "name should be unique" do
        @category.save
        category2 = Category.new( name: "sports" )
        assert_not category2.valid?
    end
    
    test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
    end

    test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
    end

end