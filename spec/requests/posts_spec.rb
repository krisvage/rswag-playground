require 'swagger_helper'

RSpec.describe 'posts', openapi_spec: "v1/swagger.yaml", type: :request do
  path '/api/v1/posts' do
    get('list posts') do
      let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }
      let!(:posts) do
        10.times do
          Post.create!(
            title: Faker::Book.title,
            content: Faker::Lorem.word,
            user:,
          )
        end
      end

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/posts'
        produces "application/json"
        consumes "application/json"

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        rescue JSON::ParserError
          binding.break
        end

        run_test! do |response|
          response.parsed_body.deep_symbolize_keys => { data: [{
            id: 1,
            attributes: {
              title:
            }
          }, *] }
          expect(title).to(be_present)
        end
      end
    end

    post('create post') do
      parameter name: :post_params, in: :body, schema: {
        type: :object,
        properties: {
          data: {
            type: :object,
            properties: {
              type: { type: :string },
              attributes: {
                title: { type: :string },
                content: { type: :string },
                user_id: { type: :string }
              }
            }
          }
        }
      }

      let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }
      let(:post_params) do
        {
          data: {
            type: "posts",
            attributes: {
              title: "Created Post",
              content: "Lorem ipsum",
              user_id: user.id
            }
          }
        }
      end

      produces "application/json"
      consumes "application/json"

      response(201, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show post') do
      produces "application/json"
      consumes "application/json"

      let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }
      let!(:post) { Post.create!({ title: 'Post Title', content: 'Post content', user: }) }

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/post'

        let(:id) { post.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
