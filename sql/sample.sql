select route_id, count(*) 
from better_city.schedule_detail 
group by route_id
