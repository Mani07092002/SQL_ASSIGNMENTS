Task 4
1)SELECT 
    v.venue_name,
    (SELECT AVG(e.ticket_price)
     FROM Event e
     WHERE e.venue_id = v.venue_id) AS avg_ticket_price
FROM 
    Venue v
ORDER BY 
    avg_ticket_price DESC;
2)SELECT 
    event_id,
    event_name,
    total_seats,
    available_seats,
    (total_seats - available_seats) AS tickets_sold
FROM 
    Event e
WHERE 
    (SELECT (total_seats - available_seats) / total_seats
     FROM Event
     WHERE event_id = e.event_id) > 0.5;
3)SELECT 
    e.event_id,
    e.event_name,
    (SELECT SUM(b.num_tickets)
     FROM Booking b
     WHERE b.event_id = e.event_id) AS total_tickets_sold
FROM 
    Event e
ORDER BY 
    total_tickets_sold DESC;
4)SELECT 
    c.customer_id,
    c.customer_name
FROM 
    Customer c
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM Booking b
        WHERE b.customer_id = c.customer_id
    );
5)SELECT 
    e.event_id,
    e.event_name,
    e.total_seats,
    e.available_seats
FROM 
    Event e
WHERE 
    e.event_id NOT IN (
        SELECT DISTINCT b.event_id 
        FROM Booking b
    );
6)SELECT 
    e.event_type,
    SUM(t.total_tickets_sold) AS total_tickets_sold
FROM 
    Event e
JOIN (
    SELECT 
        b.event_id,
        SUM(b.num_tickets) AS total_tickets_sold
    FROM 
        Booking b
    GROUP BY 
        b.event_id
) t ON e.event_id = t.event_id
GROUP BY 
    e.event_type
ORDER BY 
    total_tickets_sold DESC;
7)SELECT 
    e.event_id,
    e.event_name,
    e.ticket_price
FROM 
    Event e
WHERE 
    e.ticket_price > (
        SELECT AVG(ticket_price) 
        FROM Event
    );
8)SELECT 
    c.customer_id,
    c.customer_name,
    (SELECT SUM(b.total_cost) 
     FROM Booking b 
     WHERE b.customer_id = c.customer_id) AS total_revenue
FROM 
    Customer c
ORDER BY 
    total_revenue DESC;
9)SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.phone_number
FROM 
    Customer c
WHERE 
    c.customer_id IN (
        SELECT b.customer_id
        FROM Booking b
        WHERE b.event_id IN (
            SELECT e.event_id
            FROM Event e
            WHERE e.venue_id =9
        )
    );
10)SELECT 
    e.event_type,
    SUM(b.num_tickets) AS total_tickets_sold
FROM 
    Event e
LEFT JOIN 
    Booking b ON e.event_id = b.event_id
GROUP BY 
    e.event_type
ORDER BY 
    e.event_type;
11)SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.phone_number,
    DATEPART(MONTH, b.booking_date) AS booking_month
FROM 
    Customer c
JOIN 
    Booking b ON c.customer_id = b.customer_id
WHERE 
    b.booking_date IN (
        SELECT b2.booking_date
        FROM Booking b2
        WHERE DATEPART(YEAR, b2.booking_date) = YEAR(GETDATE())
    )
ORDER BY 
    booking_month, c.customer_name;
12)SELECT 
    v.venue_id,
    v.venue_name,
    (SELECT AVG(e.ticket_price) 
     FROM Event e 
     WHERE e.venue_id = v.venue_id) AS average_ticket_price
FROM 
    Venue v
WHERE 
    v.venue_id IN (
        SELECT DISTINCT e.venue_id
        FROM Event e
    )
ORDER BY 
    v.venue_id;