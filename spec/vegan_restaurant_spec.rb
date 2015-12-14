describe "VeganRestaurant" do

  context '#initialize' do
    it 'assigns the attributes for the objects based on the keys and values passed' do
      # Setups
      attributes = {:name => "Punch Bar", :rating => 10}

      # Does Something
      punch_bar = VeganRestaurant.new(attributes)

      # Tests Expectations
      expect(punch_bar.name).to eq("Punch Bar")
      expect(punch_bar.rating).to eq(10)
    end

    it 'saves the instance to the class variable @@all' do

      punch_bar = VeganRestaurant.new
      #expects @@all to contain list of restaurant instances 
      expect(VeganRestaurant.all).to include(punch_bar)
    end
  end

  context '.find_by_postcode' do
    it 'returns the restaurants for the zipcode' do
      # class TestFile
      #   def read
      #     "{entries: [{name: 'Punch Bar'}]}"
      #   end
      # end
      tmp_file = double(:tmp_file, :read => "{\"entries\": [{\"name\" : \"Punch Bar\"}]}")

      expect(VeganRestaurant).to receive(:open).and_return(tmp_file)

      restaurants = VeganRestaurant.find_by_postcode(1000)

      expect(restaurants.size).to eq(1)
      expect(restaurants[0].name).to eq('Punch Bar')
    end
  end

end