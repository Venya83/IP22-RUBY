require 'pony'

Pony.mail({
  :from => 'huiglot_003@mail.ru',
  :to => 'stalcerdolgggggg@gmail.com',
  :subject => 'Скидки на AliExpress!',
  :body => 'Не упусти свой шанс купить TWS наушники realme Buds Air 3 всего за 7999 рублей!!!',
  :via => :smtp,
  :via_options => {
    :address => 'smtp.mail.ru',
    :port => '465',
    :tls => true,
    :enable_starttls_auto => true,
    :user_name => 'huiglot_003@mail.ru',
    :password => '4',
    :authentication => :plain
  }
})
