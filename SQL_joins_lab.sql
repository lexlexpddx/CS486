select distinct
	t.name
from
	team t 
join teamrel t2 on t.team_id = t2.team_id
join agent a on t2.agent_id = a.agent_id
join languagerel l on a.agent_id = l.agent_id
join "language" l2 on l.lang_id = l2.lang_id
where l2.lang_id = 11;

select
	m."name",
	s.description 
from
	mission m
join securityclearance s on m.access_id = s.sc_id;

select
	m.name,
	s.description
from
	securityclearance s
left join mission m on m.access_id = s.sc_id;