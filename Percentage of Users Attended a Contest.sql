Select r.Contest_id, round(Count(r.contest_id)/(SELECT COUNT(*) From Users)*100,2) percentage
From Register r 
GROUP BY r.Contest_id
ORDER BY percentage desc, r.contest_id
