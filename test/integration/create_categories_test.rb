require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "get new category form and create new category" do 
    #simulates a user taking the new path
        get new_category_path
    #checks if test follows path
        assert_template 'categories/new'
    #checks if a category is added and redirected to the create path
        assert_difference 'Category.count', 1 do
        post_via_redirect categories_path, category: {name: "sports"}
        end
        #checks if creation of category takes us to the index page
        assert_template 'categories/index'
        #checks the body for sports
        assert_match 'sports', response.body
    end
    
    test "invalid category submission ends in failure" do

        get new_category_path
        assert_template 'categories/new'
        # category count should not change
        assert_no_difference 'Category.count' do
        # a failing :name post is different from above
        post categories_path, category: {name: " "}
        end
        #test renders new instead of index
        assert_template 'categories/new'

    end

end
