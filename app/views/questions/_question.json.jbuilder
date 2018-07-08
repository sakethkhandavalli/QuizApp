json.extract! question, :id, :description, :subgenre_id, :qtype, :opt1, :opt2, :opt3, :opt4, :crt1, :crt2, :crt3, :crt4, :created_at, :updated_at
json.url question_url(question, format: :json)
