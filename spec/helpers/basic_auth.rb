def encoded_auth_credentials
  # TODO put them in ENV['...']
  username = 'dhh'
  password = 'secret'

  ActionController::HttpAuthentication::Basic
    .encode_credentials(username, password)
end

def http_login
  request.env['HTTP_AUTHORIZATION'] = encoded_auth_credentials
end

def authenticate
  page.driver.header 'Authorization', encoded_auth_credentials
end
