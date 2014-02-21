apt_repository 'awesome-demo' do
  uri        'http://demo.awesome-co.com/deb'
  components ['main']
end

package 'awesome-demo' do
  action :upgrade
  notififes :restart, 'service[awesome-demo]', :delayed
end

service 'awesome-demo' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end
