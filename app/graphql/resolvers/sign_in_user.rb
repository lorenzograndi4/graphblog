class Resolvers::SignInUser < GraphQL::Function
  # this could also be a Mutation class
  argument :email, !Types::AuthProviderEmailInput

  # defines inline return type for the mutation
  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    input = args[:email]

    # basic validation
    return unless input

    user = User.find_by(email: input[:email])

    # ensures we have the correct user
    return unless user
    return unless user.authenticate(input[:password])

    # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user-id:#{ user.id }")

    _ctx[:session][:token] = token

    OpenStruct.new({
      user: user,
      token: AuthToken.token(user)
    })
  end
end
