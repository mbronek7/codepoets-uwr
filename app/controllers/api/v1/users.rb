# frozen_string_literal: true

module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return list of users",
             is_array: true,
             http_codes: [
               { code: 200, message: "get Users", model: API::Entities::Users::Index },
               { code: 404, message: "VisitsNotFound" }
             ]
        get do
          users = User.all
          present users, with: API::Entities::Users::Index
        end
        route_param :id do
          desc "Return a user by id",
               is_array: false,
               http_codes: [
                 { code: 200, message: "get User", model: API::Entities::Users::User },
                 { code: 404, message: "Couldn not find User with id={#id}" }
               ]
          get do
            user = User.find(params[:id])
            present user, with: API::Entities::Users::User
          end

          desc "Delete a User"
          delete do
            user = User.find(params[:id])
            user.destroy!
          end

          desc "Update a User" do
            http_codes [
              { code: 200, message: "User Updated", model: API::Entities::Users::User },
              { code: 422, message: "Validation Errors" }
            ]
          end
          params do
            requires :id, type: Integer, desc: "Identity of User", documentation: { example: 1 }
            requires :user, type: Hash, documentation: { param_type: "body" } do
              optional :name, type: String, desc: "Name", documentation: { example: "Czesław" }
              optional :email, type: String, desc: "Email", documentation: { example: "Czapka" }
              optional :biography, type: String, desc: "Biography", documentation: { example: "Born in Wrocław" }
              optional :website_url, type: String, desc: "Website Url", documentation: { example: "czesio.pl" }
              optional :birthdate, type: Date, desc: "Birthdate", documentation: { example: "1998-03-29" }
              optional :proffesion, type: String, desc: "Proffesion", documentation: { example: "Node.js Developer" }
            end
          end
          put do
            user = User.find_by_id(params[:id])
            user.update_attributes(params[:user])
            user.save!
            present patient, with: API::Entities::Users::User
          end
        end
      end
    end
  end
end
