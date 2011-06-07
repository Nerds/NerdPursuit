require 'minitest/autorun'
require 'json-schema'

SCHEMA_FILE = File.join(File.dirname(File.expand_path(__FILE__)) , 'schema', 'question.json')
QUESTIONS_PATH = File.join(File.dirname(File.expand_path(__FILE__)) , 'questions')
schema = File.open(SCHEMA_FILE) { |f| JSON.parse(f.read) }

describe 'question' do
  Dir["#{QUESTIONS_PATH}/**/*\.*"].each do |file|
    it "#{file.sub(/(\..*$)/,'').sub(/^#{QUESTIONS_PATH}/,'')} contains valid json" do


      begin
        question = File.open(file) { |f| JSON.parse(f.read) }['question']
        JSON::Validator.validate!(schema, question, version: :draft3 )
      rescue JSON::Schema::ValidationError => schema_error
         assertion =  false, schema_error.message
      rescue JSON::ParserError => parser_error
         assertion =  false, parser_error.message
      else
         assertion = true
      end

      assert *assertion
    end
  end
end
