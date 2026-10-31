select *
from {{source('erp', 'person_person')}}
where businessentityid = 291
