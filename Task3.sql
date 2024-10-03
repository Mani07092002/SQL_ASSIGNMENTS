Task-3
1)SELECT event_name, AVG(ticket_price) AS average_ticket_price
FROM Event
GROUP BY event_name;
2)SELECT event_name, SUM((total_seats - available_seats) * ticket_price) AS total_revenue
FROM Event
GROUP BY event_name
3)SELECT TOP 1 event_name, (total_seats - available_seats) AS tickets_sold
FROM Event
ORDER BY tickets_sold DESC;
4)
SELECT event_name, (total_seats - available_seats) AS tickets_sold
FROM Event;
5)SELECT event_name, total_seats, available_seats
FROM Event
WHERE total_seats = available_seats;
6)
SELECT TOP 1 c.customer_id, c.customer_name, SUM(b.num_tickets) AS total_tickets_booked
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_tickets_booked DESC;
7)SELECT 
    YEAR(event_date) AS event_year,
    MONTH(event_date) AS event_month,
    event_name,
    SUM(total_seats - available_seats) AS total_tickets_sold
FROM Event
GROUP BY 
    YEAR(event_date), 
    MONTH(event_date), 
    event_name
ORDER BY 
    event_year, event_month;
8)
SELECT 
    v.venue_name,
    AVG(e.ticket_price) AS avg_ticket_price
FROM 
    Event e
JOIN 
    Venue v ON e.venue_id = v.venue_id
GROUP BY 
    v.venue_name
ORDER BY 
    avg_ticket_price DESC;
9)
SELECT 
    event_type,
    SUM(total_seats - available_seats) AS total_tickets_sold
FROM 
    Event
GROUP BY 
    event_type
ORDER BY 
    total_tickets_sold DESC;
10)
SELECT 
    YEAR(event_date) AS event_year,
    SUM((total_seats - available_seats) * ticket_price) AS total_revenue
FROM 
    Event
GROUP BY 
    YEAR(event_date)
ORDER BY 
    event_year;
11)SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT b.event_id) AS number_of_events
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    COUNT(DISTINCT b.event_id) > 1
ORDER BY 
    number_of_events DESC;
12)SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.total_cost) AS total_revenue_generated
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
GROUP BY 
    c.customer_id, c.customer_name
ORDER BY 
    total_revenue_generated DESC;
13)SELECT 
    e.event_type,
    v.venue_name,
    AVG(e.ticket_price) AS avg_ticket_price
FROM 
    Event e
JOIN 
    Venue v ON e.venue_id = v.venue_id
GROUP BY 
    e.event_type, v.venue_name
ORDER BY 
    e.event_type, avg_ticket_price DESC;
14)SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.num_tickets) AS total_tickets_purchased
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
WHERE 
    b.booking_date >= DATEADD(DAY, -30, GETDATE())
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    SUM(b.num_tickets) > 0
ORDER BY 
    total_tickets_purchased DESC;