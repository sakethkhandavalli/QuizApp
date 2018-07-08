require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { crt1: @question.crt1, crt2: @question.crt2, crt3: @question.crt3, crt4: @question.crt4, description: @question.description, opt1: @question.opt1, opt2: @question.opt2, opt3: @question.opt3, opt4: @question.opt4, qtype: @question.qtype, subgenre_id: @question.subgenre_id } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { crt1: @question.crt1, crt2: @question.crt2, crt3: @question.crt3, crt4: @question.crt4, description: @question.description, opt1: @question.opt1, opt2: @question.opt2, opt3: @question.opt3, opt4: @question.opt4, qtype: @question.qtype, subgenre_id: @question.subgenre_id } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
