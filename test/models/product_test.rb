require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	def setup
		@former_product = Product.first
    @product = Product.last
  end

  test "product name shouldn't be empty" do
  	@product.name = ""
  	assert_not @product.valid?
  end

  test "product name shouldn't be blank" do
  	@product.name = "      "
  	assert_not @product.valid?
  end

  test "product name shouldn't be longer than 25 characters" do
  	@product.name = "a_very_long_test_name_with_more_than_25_characters"
  	assert_not @product.valid?
	end

	test "product name should be unique" do
		@product.name = @former_product.name
		assert_not @product.valid?
	end

	test "product description shouldn't be empty" do
  	@product.description = ""
  	assert_not @product.valid?
  end

  test "product description shouldn't be blank" do
  	@product.description = "      "
  	assert_not @product.valid?
  end

  test "product description shouldn't be longer than 750 characters" do
  	@product.description = "a_very_long_test_name_with_more_than_25_characters" * 1000
  	assert_not @product.valid?
	end

	test "product due date should be current date + selected period" do
		@new_product = Product.new(
			name: "New Product",
			description: "New Product Description",
			image_file_name: "silla.jpg",
			image_content_type: "image/jpg",
			image_file_size: 6976
			)
		@new_product.period = 20
		@new_product.save
		assert @new_product.due_date == 20.days.from_now.to_date
	end

end
