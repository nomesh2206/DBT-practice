select project_id, round(sum(experience_years)/count(project_id),2) as average_years
from Project inner join Employee 
using(employee_id)
group by project_id
