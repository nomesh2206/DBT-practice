select p.project_id
from Project p
group by p.project_id
having count(p.employee_id) = 
    (select max(p1.employee_cnt)
    from (select project_id, count(employee_id) as employee_cnt
         from Project
         group by project_id) p1
    )
