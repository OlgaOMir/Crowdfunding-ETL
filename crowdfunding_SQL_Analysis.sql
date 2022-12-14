-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
select cf_id, backers_count
from campaign
where outcomne in ('live')
order by backers_count DESC


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select cf_id, count(backer_id)
from backers
group by cf_id
order by count(backer_id) DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
select con.first_name, con.last_name, con.email, cam.goal - cam.pledged as Remaining_Goal_Amount
into email_contacts_remaining_goal_amount
from contacts as con
join campaign as cam on con.contact_id = cam.contact_id
where cam.outcomne in ('live')
order by remaining_goal_amount desc



-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

select b.email, b.first_name, b.last_name, b.cf_id, cam.company_name, cam.description, cam.goal - cam.pledged as Left_of_Goal
into email_backers_remaining_goal_amount
from backers as b
join campaign as cam on b.cf_id = cam.cf_id
where cam.outcomne in ('live')
order by b.email desc -- tables is ordered by email per instructions, the module sample tables is ordered by last_name in ascending order


-- Check the table













