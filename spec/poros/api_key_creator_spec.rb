require 'rails_helper'

describe ApiKeyCreator, type: :class do
  describe 'class methods' do
    it 'generate_api_key' do
      test1 = ApiKeyCreator.generate_api_key
      test2 = ApiKeyCreator.generate_api_key
      test3 = ApiKeyCreator.generate_api_key

      expect(test1).to_not eq(test2)
      expect(test1).to_not eq(test3)
      expect(test2).to_not eq(test3)
    end
  end
end
