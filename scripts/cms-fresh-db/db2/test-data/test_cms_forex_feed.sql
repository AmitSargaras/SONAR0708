insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'AED', 0.91251, 1, current_timestamp, 0.86662, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'AUD', 3.181, 1, current_timestamp, 3.111, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'BDT', 0.05172, 1, current_timestamp, 0.04591, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'BND', 2.426, 1, current_timestamp, 2.372, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'CAD', 3.243, 1, current_timestamp, 3.174, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'CHF', 3.217, 1, current_timestamp, 3.153, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'DKK', 0.71204, 1, current_timestamp, 0.66105, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'EUR', 5.173, 1, current_timestamp, 5.072, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'GBP', 6.538, 1, current_timestamp, 6.41, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'HKD', 0.43045, 1, current_timestamp, 0.4076, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'IDR', 0.000375, 1, current_timestamp, 0.000334, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'INR', 0.07878, 1, current_timestamp, 0.072672, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'JPY', 0.03095, 1, current_timestamp, 0.0303, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'MYR', 1, 1, current_timestamp, 1, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'NOK', 0.66495, 1, current_timestamp, 0.61871, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'NZD', 2.516, 1, current_timestamp, 2.441, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'PHP', 0.07407, 1, current_timestamp, 0.06984, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'SEK', 0.56855, 1, current_timestamp, 0.52281, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'SGD', 2.426, 1, current_timestamp, 2.372, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'THB', 0.11062, 1, current_timestamp, 0.09129, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'USD', 3.299, 1, current_timestamp, 3.236, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'QAR', 0.92082, 1, current_timestamp, 0.87364, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'PKR', 0, 1, current_timestamp, 0, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'DEM', 1, 1, current_timestamp, 0, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'FRF', 0, 1, current_timestamp, 0, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'BHD', 9.8, 1, current_timestamp, 0, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'LKR', 0.02973, 1, current_timestamp, 0, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'SAR', 0, 1, current_timestamp, 0, 1, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'BWP', 0.56, 1, current_timestamp, 0, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'EGP', 0.635, 1, current_timestamp, 0, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));
insert into cms_forex (feed_id, buy_currency, sell_currency, buy_rate, buy_unit, effective_date, sell_rate, sell_unit, feed_group_id, cms_version_time, feed_ref) values 
(cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint),
'MYR', 'CNY', 0.4575, 1, current_timestamp, 0, 100, (select feed_group_id from cms_feed_group where group_type = 'FOREX'), 0,
cast((ts_fmt(current_timestamp, 'yyyymmdd') || substr(digits(next value for forex_seq),2))as bigint));

