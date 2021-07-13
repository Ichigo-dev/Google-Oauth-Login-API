module Users
  class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
    def omniauth_success
      get_resource_from_auth_hash
      set_token_on_resource
      create_auth_params

      sign_in(:user, @resource, store: false, bypass: false)

      if @resource.save!
        yield @resource if block_given?
        update_auth_header
        # auth_header = @resource.build_auth_header(@token.token, @token.client)
        # auth_header.each do |key, value|
        #   cookies[:"#{key.gsub("-", "_")}_name"] = { value: value, httponly: true }
        # end
        redirect_to 'http://localhost:3001', test: 'test'
        # render json: @resource, status: :ok
      else
        render json: { message: "failed to login" }, status: 500
      end

      # 本実装時はこちらを使用する
      # @resource.save!
      #       
      # update_auth_header # これは自分で追加する
      # yield @resource if block_given?
      #
      # render_data_or_redirect('deliverCredentials', @auth_params.as_json, @resource.as_json)

    end

    protected

    def get_resource_from_auth_hash
      # find or create user by provider and provider uid
      @resource = resource_class.where({
        uid:      auth_hash['uid'],
        provider: auth_hash['provider']
      }).first_or_initialize

      if @resource.new_record?
        @oauth_registration = true
        # これが呼ばれるとエラーになるのでコメントアウトする
        #set_random_password
      end

      # sync user info with provider, update/generate auth token
      assign_provider_attrs(@resource, auth_hash)

      # assign any additional (whitelisted) attributes
      extra_params = whitelisted_params
      @resource.assign_attributes(extra_params) if extra_params

      @resource
    end
  end 
end
