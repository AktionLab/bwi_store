PaymentMethod.class_eval do
  default_scope order('id DESC')
end

