class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :get_subgenre

  def subglboard
  end

  def glboard
  end

  def answers
    crt = []
    crt.push(params['crt1'])
    crt.push(params['crt2'])
    crt.push(params['crt3'])
    crt.push(params['crt4'])
    if(params.has_key?('answer_ids'))
        t = []
        i = 4
        while i>0
          t.push('false')
          i = i-1
        end
        for i in params['answer_ids']
          t[(i.to_i)-1] = 'true'
        end
        len = crt.length
        i = 0
        flg = 0
        while i != len
          if(crt[i] != t[i])
            flg = 2000
            break
          end
          i = i + 1
        end
        params['flag'] = flg
    end
  end

  # GET /questions
  # GET /questions.json
  def index
    if(params.has_key?(:f))
      if State.find_by(user_id: session['user_id'] , subgenre_id: $subgenre) != nil
        State.find_by(user_id: session['user_id'] , subgenre_id: $subgenre).update_attribute(:index , 0)
        State.find_by(user_id: session['user_id'] , subgenre_id: $subgenre).update_attribute(:score , 0)
      end
    end
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def question_params
      obj = params.require(:question).permit(:description, :qtype, :opt1, :opt2, :opt3, :opt4, :crt1, :crt2, :crt3, :crt4)
      obj[:subgenre_id] = $subgenre
      return obj
    end
end
