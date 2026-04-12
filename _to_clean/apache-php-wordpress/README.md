docker build -t php8.4.5-apache-4worpress .

sudo systemctl disable apache2

select replace(url, 'http', 'https') from `wp_yoast_seo_links` where url like 'http://xxxxxxxxxxx/%';

update `wp_yoast_seo_links` set url = replace(url, 'http', 'https') where url like 'http://xxxxxxxxxxxxx/%';

https://www.malcare.com/blog/wordpress-not-loading-css-over-https/

Force HTTPS usage by adding the following command to the wp-config.php file:
if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')
$_SERVER['HTTPS']='on';
CopyCode

>> Ensure you add it before the following line: (this was the key of the fix

require_once(ABSPATH . 'wp-settings.php');



