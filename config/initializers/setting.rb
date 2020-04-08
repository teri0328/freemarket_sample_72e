# # Payjp.api_key = 'pk_tok_85da5ba3a3d69a74ca506db55ad4'
# # charge = Payjp::Charge.create(
# #   :amount => 3500,
# #   :card => 'tok_76e202b409f3da51a0706605ac81',
# #   :currency => 'jpy',
# # )

# require 'payjp'
# Payjp.api_key = 'pk_test_987ff3dd7d5519b4992219fc'
# Payjp.open_timeout = 30 # optionally
# Payjp.read_timeout = 90 # optionally

# # ex, create charge
# charge = Payjp::Charge.create(
#   :amount => 3500,
#   :card => 'token_id',
#   :currency => 'jpy',
# )