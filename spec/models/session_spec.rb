require 'rails_helper'

describe 'Canvas-initiated session' do
  before :all do
    @s = Session.new(
      :custom_canvas_user_id => '4935956',
      :custom_canvas_login_id => '1029213',
      :custom_canvas_course_id => '1451720',
      :context_title => 'Software Engineering F16')
  end
  describe 'populating' do
    describe 'finds group' do
      before :each do
        VCR.use_cassette('lookup_group') { @others = @s.find_group_for_student }
      end
      specify 'and length is correct' do
        expect(others.length).to eq 5
      end
      specify 'and membership is correct' do
        group = [4935956,4857339,4919912,4612018,4920351]
        group.each do |member_id|
          expect(others.select { |s| s['id'].to_s == member_id.to_s }.length).to eq(1)
        end
      end
    end
  end
end
