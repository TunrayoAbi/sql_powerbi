select *
from donation_data;

select *
from donor_data;

--Total Fund Donated
select sum(donation) as Total_Fund
from donation_data;

--Total donation and Number of donation by gender
select gender, sum(donation), count(donation)
from donation_data
Group by gender;

--Total donation bt state
--Top 10 states with least amount of donation

select state, sum(donation)
from donation_data
group by state
order by sum(donation)asc
Limit 10;

--Top 10 states with the highest amount of donation
select state, sum(donation)
from donation_data
group by state
order by sum(donation)desc
limit 10;

--Total donation by frequency of donation
select sum(donation_data.donation),donor_data.donation_frequency
from donation_data
join donor_data
on donation_data.ID = donor_data.ID
Group by donation_frequency;

--Total donation by job field
select job_field, sum(donation), count(donation)
from donation_data
group by job_field;

--Group of donation according to amount
-- sum and count of donations greater than $200
select sum(donation), count(donation)
from donation_data
where donation >200;

select sum(donation), count(donation)
from donation_data
where donation =200;

select sum(donation), count(donation)
from donation_data
where donation <200;

--donation by donors' car type
select donor_data.car, sum(donation_data.donation)
from donation_data
join donor_data
on donation_data.ID = donor_data.ID
group by donor_data.car
order by sum(donation_data.donation)desc
limit 10;

--donors who speak a second language according to donation frequency
select donor_data.donation_frequency,count(donor_data.second_language), sum(donation_data.donation)
from donation_data
join donor_data
on donation_data.ID = donor_data.ID
group by donor_data.donation_frequency
order by count(donor_data.second_language)desc;