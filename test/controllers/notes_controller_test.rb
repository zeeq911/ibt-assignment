require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get notes" do
    get notes_path
    assert_response :success
  end

end
