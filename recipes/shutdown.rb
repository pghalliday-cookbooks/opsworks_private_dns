layer_name = node['opsworks_private_dns']['layer_name']
first_ip =  node['opsworks']['layers'][layer_name]['instances'].first[1]['private_ip']
my_ip = node['opsworks']['instance']['private_ip']
if my_ip == first_ip
  aws_cli_route53_record_sets 'private_dns' do
    hosted_zone_id node['opsworks_private_dns']['hosted_zone_id']
    access_key_id node['opsworks_private_dns']['access_key_id']
    secret_access_key node['opsworks_private_dns']['secret_access_key']
    ip node['opsworks']['instance']['private_ip']
    hosts([
      node['opsworks_private_dns']['hostname']
    ])
    action :delete
  end
end
